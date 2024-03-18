app.controller('CountryController', function ($scope, $http, $timeout, $filter, GlobalServices) {
    $scope.Title = 'Country';

    OnClickDefault();
    $scope.LoadData = function () {
        $('.select2').select2();
        $scope.confirmMSG = GlobalServices.getConfirmMSG();
        $scope.perPageColl = GlobalServices.getPerPageList();
        $scope.currentPages = {
            Country: 1,
        };

        $scope.searchData = {
            Country: '',

        };

        $scope.perPage = {
            Country: GlobalServices.getPerPageRow()
        };


        $scope.newCountry = {
            CountryId: null,
            OrderNo: 0,
            Code: '',
            CountryName: '',
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };


        $scope.GetAllCountryList();


    };

    $scope.ClearCountry = function () {
        $scope.newCountry = {
            CountryId: null,
            OrderNo: 0,
            Code: '',
            CountryName: '',
            Status: false,

            Mode: 'रेकर्ड सेभ गर्नुहोस '
        };
    }
    /*
        $scope.handleRadioButtonChange = function () {
            if ($scope.newCountry.Status === true) {
                $scope.newCountry.StatusLabel  = "सक्रिय"; // Set the label for active
            } else {
                $scope.newCountry.StatusLabel  = "निष्क्रिय"; // Set the label for inactive
            }
        };
        $scope.handleRadioButtonChange();*/

    //Show hide jf for TollDetails

    function OnClickDefault() {



        /*  show or hide Country*/

        document.getElementById('Country-form').style.display = "none";

        document.getElementById('add-Country-change').onclick = function () {
            document.getElementById('Country-section').style.display = "none";
            document.getElementById('Country-form').style.display = "block";
        }
        document.getElementById('back-to-list-Country').onclick = function () {
            document.getElementById('Country-form').style.display = "none";
            document.getElementById('Country-section').style.display = "block";
        }


    };



    //************************* Country *********************************
    $scope.IsValidCountry = function () {
        if ($scope.newCountry.CountryName.isEmpty()) {
            Swal.fire('Please ! Enter Country Name');
            return false;
        }
        return true;
    }

    $scope.SaveUpdateCountry = function () {
        if ($scope.IsValidCountry() == true) {
            if ($scope.confirmMSG.Accept == true) {
                var saveModify = $scope.newCountry.Mode;
                Swal.fire({
                    title: 'Do you want to ' + saveModify + ' the current data?',
                    showCancelButton: true,
                    confirmButtonText: saveModify,
                }).then((result) => {
                    /* Read more about isConfirmed, isDenied below */
                    if (result.isConfirmed) {
                        $scope.CallSaveUpdateCountry();
                    }
                });
            } else
                $scope.CallSaveUpdateCountry();
        }
    };

    $scope.CallSaveUpdateCountry = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/SaveCountry",
            headers: { 'Content-Type': undefined },
            transformRequest: function (data) {
                var formData = new FormData();
                formData.append("jsonData", angular.toJson(data.jsonData));
                return formData;
            },
            data: { jsonData: $scope.newCountry }
        }).then(function (res) {
            $scope.loadingstatus = "stop";
            hidePleaseWait();
            Swal.fire(res.data.ResponseMSG);
            if (res.data.IsSuccess == true) {
                $scope.ClearCountry();
                $scope.GetAllCountryList();
            }
        }, function (errormessage) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
        });
    }



    $scope.GetAllCountryList = function () {
        $scope.loadingstatus = "running";
        showPleaseWait();
        $scope.CountryList = [];
        $http({
            method: 'GET',
            url: base_url + "Setup/Creation/GetAllCountry",
            dataType: "json"
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.CountryList = res.data.Data;
            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    }

    $scope.getCountryById = function (refData) {
        $scope.loadingstatus = "running";
        showPleaseWait();
        var para = {
            CountryId: refData.CountryId
        };
        $http({
            method: 'POST',
            url: base_url + "Setup/Creation/getCountryById",
            dataType: "json",
            data: JSON.stringify(para)
        }).then(function (res) {
            hidePleaseWait();
            $scope.loadingstatus = "stop";
            if (res.data.IsSuccess && res.data.Data) {
                $scope.newCountry = res.data.Data;
                $scope.newCountry.Mode = 'रेकर्ड अपडेट गर्नुहोस';
                document.getElementById('Country-section').style.display = "none";
                document.getElementById('Country-form').style.display = "block";

            } else {
                Swal.fire(res.data.ResponseMSG);
            }
        }, function (reason) {
            Swal.fire('Failed' + reason);
        });
    };

    $scope.DelCountryById = function (refData, ind) {
        Swal.fire({
            title: 'Are you sure you want to delete ' + refData.Code + '?',
            showCancelButton: true,
            confirmButtonText: 'Delete',
            //message: 'Are you sure to delete selected Country :-' + beData.Name,
        }).then((result) => {
            if (result.isConfirmed) {
                var para = { CountryId: refData.CountryId };
                $http({
                    method: 'POST',
                    url: base_url + "Setup/Creation/DeleteCountry",
                    dataType: "json",
                    data: JSON.stringify(para)
                }).then(function (res) {
                    hidePleaseWait();
                    $scope.loadingStatus = "stop";

                    Swal.fire(res.data.ResponseMSG);
                    if (res.data.IsSuccess == true) {
                        $scope.GetAllCountryList();
                    }
                }, function (reason) {
                    Swal.fire('Failed' + reason);
                });
            }

        });
    }



});