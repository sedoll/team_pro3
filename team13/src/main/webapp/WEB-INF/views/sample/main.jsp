<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${user}</title>
</head>
<body>
    <h2>${user}</h2>
    <h2>POST 방식1</h2>
    <div>
        <form name="post1" action="./post1.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post1"/>
        </form>
    </div>
    <hr>

    <h2>POST 방식2</h2>
    <div>
        <form name="post2" action="./post2.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post2"/>
        </form>
    </div>
    <hr>

    <h2>POST 방식3</h2>
    <div>
        <form name="post3" action="./post3.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post3"/>
        </form>
    </div>
    <hr>

    <h2>POST 방식4</h2>
    <div>
        <form name="post4" action="./post4.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post4"/>
        </form>
    </div>
    <hr>

    <h2>POST 방식5</h2>
    <div>
        <form name="post5" action="./post5.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post5"/>
        </form>
    </div>
    <hr>

    <h2>POST 방식6</h2>
    <div>
        <form name="post6" action="./post6.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post6"/>
        </form>
    </div>
    <hr>

    <h2>POST 방식7</h2>
    <div>
        <form name="post7" action="./post7.do" method="post">
            id : <input type="text" name="id" id="id" required /><br>
            pw : <input type="password" name="pw" id="pw" required /><br><br>
            <input type="submit" value="post7"/>
        </form>
    </div>
    <hr>
</body>
</html>
