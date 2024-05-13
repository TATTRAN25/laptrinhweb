@extends('dashboard')

@section('content')
<h5 class="danhSach">Danh sách bài viết</h5>
    <main class="login-form">
        <div class="container">
            <div class="row justify-content-center">
                <table>
                    <thead>
                        <tr>
                            <th>post_id</th>
                            <th>post_name</th>
                            <th>post_description</th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        @foreach($posts as $post)
                            <tr>
                                <th style="text-align: center;">{{ $post->post_id }}</th>
                                <th>{{ $post->post_name }}</th>
                                <th>{{ $post->post_description }}</th>                               
                                
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </main>
@endsection