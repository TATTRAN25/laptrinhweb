@extends('dashboard')

@section('content')
<h5 class="danhSach">Danh sách sở thích</h5>
    <main class="login-form">
        <div class="container">
            <div class="row justify-content-center">
                <table>
                    <thead>
                        <tr>
                            <th>favorite_id</th>
                            <th>favorite_description</th>
                            <th>favorite_description</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($favorities as $favorite)
                            <tr>
                                <th style="text-align: center;">{{ $favorite->favorite_id }}</th>
                                <th>{{ $favorite->favorite_name }}</th>
                                <th>{{ $favorite->favorite_description }}</th>                               
                                
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </main>
@endsection