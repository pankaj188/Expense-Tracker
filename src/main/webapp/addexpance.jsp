<%@include file="head.jsp" %>
    <form action="addexpenseprocess" method="post" style="height: 90vh;">
        <div class="row" style="margin: 1px;">

            <div class="col-sm-1"></div>

            <div class="col-sm-10" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">

                <h1 align="center">Add Expense Here</h1>
                <div align="center">
                    <b>${msg}</b>
                </div>
                <hr>

                <div class="col-md-2"></div>

                <div class="col-md-4">
                    <br>
                    <div class="form-group">
                        <label for="name">Product Name:</label> <input type="text" class="form-control" id="name"
                            placeholder="Enter Name" autocomplete="off" name="name" required="required">
                    </div>
                    <div class="form-group">
                        <label for="price">Product Price:</label> <input type="number" step="0.1" class="form-control"
                            id="price" placeholder="Enter Price" name="price" required="required">
                    </div>
                </div>


                <div class="col-md-4">
                    <br>>
                    <div class="form-group">
                        <label for="quantity">Product Quantity</label> <input type="number" class="form-control"
                            id="quantity" min="1" name="quantity" required="required" placeholder="Enter Quantity">
                    </div>
                    <div class="form-group">
                        <label for="date">Product Date:</label> <input type="date" class="form-control" id="date"
                            name="date" required="required">
                    </div>

                </div>


                <div class="form-inline">

                    <div class="row" style="box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); transition: 0.3s;">
                        <div class="col-sm-3"></div>
                        <div class="col-sm-6" align="center">
                            <br>
                            <button type="submit" class="btn btn-primary" style="width: 100%;">Add
                                Expenses</button>
                            <br> <br> <br>
                        </div>
                        <div class="col-sm-2"></div>
                    </div>
                </div>

            </div>

        </div>

    </form>

    <%@include file="foot.jsp" %>