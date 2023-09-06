@extends('backend.layouts.app')

@section('title') {{ __($module_action) }} {{ __($module_title) }} @endsection

@section('breadcrumbs')
<x-backend-breadcrumbs>
    <x-backend-breadcrumb-item route='{{route("backend.$module_name.index")}}' icon='{{ $module_icon }}'>
        {{ __($module_title) }}
    </x-backend-breadcrumb-item>
    <x-backend-breadcrumb-item type="active">{{ __($module_action) }}</x-backend-breadcrumb-item>
</x-backend-breadcrumbs>
@endsection

@section('content')
<div class="card">
    <div class="card-body">

        <x-backend.section-header>
            <i class="{{ $module_icon }}"></i> {{ __($module_title) }} <small class="text-muted">{{ __($module_action) }}</small>

            <x-slot name="subtitle">
                @lang(":module_name", ['module_name'=>Str::title($module_name)])
            </x-slot>

            <x-slot name="toolbar">
            </x-slot>
        </x-backend.section-header>

        <div class="row mt-4">
            <div class="col">
                <table id="datatable" class="table table-bordered table-hover table-responsive-sm">
                    <thead>
                        <tr>
                            <th>
                                @lang("report::text.ticket_id")
                            </th>
                            <th>
                                @lang("report::text.reporter_name")
                            </th>
                            <th>
                                @lang("report::text.title")
                            </th>
                            <th>
                                @lang("report::text.description")
                            </th>

                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                {{ $$module_name_singular->ticket_id }}
                            </td>

                            <td>
                                {{ $$module_name_singular->reporters()->first()->name }}
                            </td>
                            <td>
                                {{ $$module_name_singular->title }}
                            </td>
                            <td>
                                {{ $$module_name_singular->description }}
                            </td>
                        </tr>
                    </tbody>
                </table>

                <table id="datatable" class="table table-bordered table-hover table-responsive-sm">
                    <thead>
                        <tr>
                            <th>
                                @lang("report::text.status")
                            </th>
                            <th>
                                @lang("report::text.category_name")
                            </th>
                            <th>
                                @lang("report::text.created_at")
                            </th>
                            <th>
                                @lang("report::text.updated_at")
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td>
                                {{ $$module_name_singular->status }}
                            </td>
                            <td>
                                {{ $$module_name_singular->category()->first()->name }}
                            </td>
                            <td>
                                {{ $$module_name_singular->created_at->format('F j Y H:i:s') }}
                            </td>
                            <td>
                                {{ $$module_name_singular->updated_at->format('F j Y H:i:s') }}

                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="card-footer">
        <div class="row">
            <div class="col-7">
            </div>
            <div class="col-5">
                <div class="float-end">
                    <div class="d-flex justify-content-center w-100">
                        <a href="#" onclick="showTracking()" class="btn btn-secondary mr-2 text-white" type="button">
                            @lang("Lihat Tracking")

                        </a>
                        <a href="#" onclick="showUpdateStatus()" class="btn btn-primary ml-2" type="button">
                            @lang("Update Status")
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="tracking" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Riwayat Laporan - Nomor Tiket : {{ $$module_name_singular->ticket_id }}</h5>
            </div>
            <div class="modal-body">
                <table id="datatable" class="table table-bordered table-hover table-responsive-sm">
                    <thead>
                        <tr>
                            <th>
                                @lang("report::text.username")
                            </th>
                            <th>
                                @lang("report::text.status")
                            </th>
                            <th>
                                @lang("report::text.note")
                            </th>
                            <th>
                                @lang("report::text.updated_at")
                            </th>
                        </tr>
                    </thead>

                    <tbody>
                        @foreach($histories as $history)
                        <tr>
                            <td>
                                {{ $history->user()->first()->username }}
                            </td>
                            <td>
                                {{ $history->status }}
                            </td>
                            <td>
                                {{ $history->note }}
                            </td>
                            <td>
                                {{ $history->updated_at->diffForHumans() }}
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="updateStatus" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Ubah Status Laporan</h5>
            </div>
            <div class="modal-body">
                {{ html()->form('POST', route('backend.reports.updateStatus',  $$module_name_singular->id))->id('create-form')->class('form-horizontal')->open() }}
                {{ csrf_field() }}

                <div class="form-group">
                    <label for="status" class="col-form-label">Status:</label>
                    <select class="form-select" aria-label="Pilih Status" name="status" id="status">
                        <option value="Pending" {{ 'Pending' === $$module_name_singular->status ? 'selected' : '' }}>Pending</option>
                        <option value="Proses Administratif" {{ 'Proses Administratif' === $$module_name_singular->status ? 'selected' : '' }}>Proses Administratif</option>
                        <option value="Proses Penanganan" {{ 'Proses Penanganan' === $$module_name_singular->status ? 'selected' : '' }}>Proses Penanganan</option>
                        <option value="Selesai Ditangani" {{ 'Selesai Ditangani' === $$module_name_singular->status ? 'selected' : '' }}>Selesai Ditangani</option>
                        <option value="Laporan Ditolak" {{ 'Laporan Ditolak' === $$module_name_singular->status ? 'selected' : '' }}>Laporan Ditolak</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="category_id" class="col-form-label">Kategori:</label>
                    <select class="form-select" aria-label="Pilih Category" id="category_id" name="category_id">
                        <option value="37" {{ '37' === $$module_name_singular->category_id ? 'selected' : '' }}>Infrastruktur</option>
                        <option value="38" {{ '38' === $$module_name_singular->category_id ? 'selected' : '' }}>Lingkungan</option>
                        <option value="39" {{ '39' === $$module_name_singular->category_id ? 'selected' : '' }}>Layanan Publik</option>
                        <option value="40" {{ '40' === $$module_name_singular->category_id ? 'selected' : '' }}>Keamanan</option>
                        <option value="41" {{ '41' === $$module_name_singular->category_id ? 'selected' : '' }}>Kesehatan</option>
                        <option value="42" {{ '42' === $$module_name_singular->category_id ? 'selected' : '' }}>Lain-lain</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="note" class="col-form-label">Catatan:</label>
                    <textarea class="form-control" id="note"></textarea>
                </div>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">Kirim</button>
            </div>
            </form>

        </div>
    </div>
</div>
<script type="text/javascript">
    function showTracking() {
        $('#tracking').modal('show')
    }

    function showUpdateStatus() {
        $('#updateStatus').modal('show')
    }
</script>
@endsection