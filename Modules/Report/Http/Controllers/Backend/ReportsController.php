<?php

namespace Modules\Report\Http\Controllers\Backend;

use App\Authorizable;
use App\Http\Controllers\Backend\BackendBaseController;
use App\Models\ReportTracker;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Str;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ReportsController extends BackendBaseController
{
    use Authorizable;

    public function __construct()
    {
        // Page Title
        $this->module_title = 'Reports';

        // module name
        $this->module_name = 'reports';

        // directory path of the module
        $this->module_path = 'report::backend';

        // module icon
        $this->module_icon = 'fa-regular fa-sun';

        // module model name, path
        $this->module_model = "Modules\Report\Models\Report";
    }

    public function index_data()
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'List';

        $page_heading = label_case($module_title);
        $title = $page_heading . ' ' . label_case($module_action);

        $$module_name = $module_model::join('reporters', 'reporters.id', '=', 'reports.reporter_id')->select('reports.id', 'reports.ticket_id', 'reporters.name as reporter_name', 'reports.title', 'reports.status', 'reports.updated_at');

        $data = $$module_name;

        return DataTables::of($$module_name)
            ->addColumn('action', function ($data) {
                $module_name = $this->module_name;

                return view('backend.includes.action_column_view', compact('module_name', 'data'));
            })
            ->editColumn('updated_at', function ($data) {
                $module_name = $this->module_name;

                $diff = Carbon::now()->diffInHours($data->updated_at);

                if ($diff < 25) {
                    return $data->updated_at->diffForHumans();
                } else {
                    return $data->updated_at->isoFormat('llll');
                }
            })
            ->rawColumns(['action'])
            ->orderColumns(['updated_at'], '-:column $1')
            ->make(true);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Show';

        $$module_name_singular = $module_model::findOrFail($id);

        logUserAccess($module_title . ' ' . $module_action . ' | Id: ' . $$module_name_singular->id);

        $histories = \App\Models\ReportTracker::where('report_id', $id)->orderBy('updated_at', 'DESC')->get();

        return view(
            "$module_path.$module_name.show",
            compact('module_title', 'module_name', 'module_path', 'module_icon', 'module_name_singular', 'module_action', "$module_name_singular", 'histories')
        );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function updateStatus(Request $request, $id)
    {
        $module_title = $this->module_title;
        $module_name = $this->module_name;
        $module_path = $this->module_path;
        $module_icon = $this->module_icon;
        $module_model = $this->module_model;
        $module_name_singular = Str::singular($module_name);

        $module_action = 'Update';

        $$module_name_singular = $module_model::findOrFail($id);

        $$module_name_singular->update($request->all());

        flash(icon() . ' ' . Str::singular($module_title) . "' Updated Successfully")->success()->important();

        $reportsTrackerData = [
            'user_id'            => Auth::id(),
            'report_id'          => $id,
            'status'             => $request->get('status'),
            'note'               => Auth::user()->username . ' mengubah status laporan menjadi ' . $request->get('request'),
        ];

        ReportTracker::create($reportsTrackerData);

        logUserAccess($module_title . ' ' . $module_action . ' | Id: ' . $$module_name_singular->id);

        return redirect()->route("backend.$module_name.show", $$module_name_singular->id);
    }
}
