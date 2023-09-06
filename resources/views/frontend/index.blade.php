@extends('frontend.layouts.app')

@section('title') {{app_name()}} @endsection

@section('content')

<section class="bg-gray-100 mb-0">
    <div class="container mx-auto flex px-5 py-10 sm:py-0 items-center justify-center flex-col">
        <div class="text-center lg:w-2/3 w-full">
            <h1 class="title-font sm:text-4xl text-3xl mb-4 font-medium text-gray-800">
                Selamat datang di Sistem pengaduan!
            </h1>
            <p class="mb-0 leading-relaxed">
                Silahkan isi formulir dibawah ini apabila Anda ingin memberikan pengaduan.
            </p>
        </div>
    </div>
</section>

<section class="mb-0">
    <div class="shadow-lg p-3 sm:p-10 rounded-lg">
        {{ html()->form('POST', route('frontend.storeReport'))->id('create-form')->class('form-horizontal')->attribute('enctype', 'multipart/form-data')->open() }}
        {{ csrf_field() }}
        <h2><b>Data Pelapor</b></h2>

        <div class="grid grid-cols-2 md:grid-cols-1">

            <div class="mb-3">
                <?php
                $field_name = 'name';
                $field_lable = __('labels.frontend.reporters.fields.name');
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>
                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'email';
                $field_lable = __('labels.frontend.reporters.fields.email');
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>
                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'phone_number';
                $field_lable = __('labels.frontend.reporters.fields.phone_number');
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>
                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'identity_type';
                $field_lable = __("labels.frontend.reporters.fields.identity_type");
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>

                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        <select name="identity_type" id="identity_type" class="select2">
                            <option value="KTP">KTP</option>
                            <option value="SIM">SIM</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'identity_number';
                $field_lable = __("labels.frontend.reporters.fields.identity_number");
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>

                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'pob';
                $field_lable = __("labels.frontend.reporters.fields.pob");
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>

                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'dob';
                $field_lable = __("labels.frontend.reporters.fields.dob");
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>

                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control datepicker')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'address';
                $field_lable = __("labels.frontend.reporters.fields.address");
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>

                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->textarea($field_name)->placeholder($field_placeholder)->class('form-control datepicker')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>
        </div>

        <h2><b>Data Pengaduan</b></h2>

        <div class="grid grid-cols-2 md:grid-cols-1">

            <div class="mb-3">
                <?php
                $field_name = 'title';
                $field_lable = __('labels.frontend.reporters.fields.title');
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>
                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->text($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

            <div class="mb-3">
                <?php
                $field_name = 'description';
                $field_lable = __('labels.frontend.reporters.fields.description');
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>
                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->textarea($field_name)->placeholder($field_placeholder)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>


            <div class="mb-3">
                <?php
                $field_name = 'proof_of_report';
                $field_lable = __('labels.frontend.reporters.fields.proof_of_report');
                $field_placeholder = $field_lable;
                $required = "required";
                ?>
                <div class="col-12 col-sm-2">
                    <div class="form-group">
                        {{ html()->label($field_lable, $field_name)->class('form-label') }} {!! fielf_required($required) !!}
                    </div>
                </div>
                <div class="col-12 col-sm-10">
                    <div class="form-group">
                        {{ html()->file($field_name)->class('form-control')->attributes(["$required"]) }}
                    </div>
                </div>
            </div>

        </div>
        <div class="grid grid-cols-1 md:grid-cols-1">
            <div class="form-group">
                <a href="#" onclick="event.preventDefault(); document.getElementById('create-form').submit();" class="flex items-center mx-2 px-4 py-2 font-medium tracking-wide text-white capitalize transition-colors duration-200 transform bg-orange-600 rounded-md hover:bg-orange-500 focus:outline-none focus:bg-orange-500 invisible md:visible">
                    <span class="mx-1 text-center">{{__('Kirim')}}</span>
                </a>

                {{ csrf_field() }}
            </div>
        </div>
    </div>
    {{ html()->form()->close() }}
</section>

@endsection