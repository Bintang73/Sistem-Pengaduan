<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\ReportTracker;
use App\Models\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Modules\Report\Models\Report;
use Modules\Reporter\Models\Reporter;

class FrontendController extends Controller
{
    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('frontend.index');
    }


    /**
     * Store the report data to database.
     *
     * @return \Illuminate\Http\Response
     */
    public function storeReport(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'              => 'required|max:255',
            'email'             => 'required|max:255',
            'phone_number'      => 'required|max:255',
            'identity_type'     => 'required|max:255',
            'identity_number'   => 'required|max:255',
            'pob'               => 'required|max:255',
            'dob'               => 'required|max:255',
            'address'           => 'required|max:255',
        ]);

        if ($validator->fails()) {
            return redirect('/')
                ->withErrors($validator)
                ->withInput();
        }

        $name = $request->get('name');
        $email = $request->get('email');
        $phone_number = $request->get('phone_number');
        $identity_type = $request->get('identity_type');
        $identity_number = $request->get('identity_number');
        $pob = $request->get('pob');
        $dob = $request->get('dob');
        $address = $request->get('address');

        $reportersData = [
            'name'                  => $name,
            'email'                 => $email,
            'phone_number'          => $phone_number,
            'identity_type'         => $identity_type,
            'identity_number'       => $identity_number,
            'pob'                   => $pob,
            'dob'                   => $dob,
            'address'               => $address,
        ];

        $reporters = Reporter::create($reportersData);

        $validator = Validator::make($request->all(), [
            'title'              => 'required|max:255',
            'description'        => 'required|max:255',
            'proof_of_report'    => 'required',
        ]);

        if ($validator->fails()) {
            return redirect('/')
                ->withErrors($validator)
                ->withInput();
        }

        $title = $request->get('title');
        $description = $request->get('description');
        $proof_of_report = $request->get('proof_of_report');

        $reportsData = [
            'reporter_id'            => $reporters->id,
            'title'                  => $title,
            'description'            => $description,
            'status'                 => Status::whereDefault(true)->firstOrFail()->name,
            'category_id'            => Category::whereSlug('lain-lain')->firstOrFail()->id,
            'ticket_id'              => empty(Report::latest()->first()) ? 1 : Report::latest()->first()->id + 1,
        ];

        $report = Report::create($reportsData);


        /**
         * Todo Image upload to media
         */



        $reportsTrackerData = [
            'user_id'            => 6,
            'report_id'          => $report->id,
            'status'             => Status::whereDefault(true)->firstOrFail()->name,
            'note'               => $reporters->name . ' Membuat laporan baru',
        ];

        ReportTracker::create($reportsTrackerData);

        logUserAccess($reporters->name . ' Membuat laporan baru ' . '| Id: ' . $report->id);

        return redirect('/');
    }
}
