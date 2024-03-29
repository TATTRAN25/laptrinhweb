@extends('dashboard')

@section('content')
    <main class="login-form">
        <div class="container">
            <div class="row justify-content-center">
                <table>
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>{{$errors->id}}</td>
                            <td>{{$errors->name}}</td>
                            <td>{{$errors->email}}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
@endsection