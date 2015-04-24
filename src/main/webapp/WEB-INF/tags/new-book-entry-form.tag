<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form id="newBookEntry" role="form">

  <div class="form-group">
    <label>Redmine</label>
    <select class="form-control redmine" onchange="TimeEntryActivities.render('newBookEntry');">
      <c:forEach items="${redmines}" var="redmine">
        <option value="${redmine.id}"><c:out value="${redmine.name}"/></option>
      </c:forEach>
    </select>
  </div>
  <div class="form-group">
    <label>Ticketnummer</label>
    <input type="number" class="form-control issue" placeholder="1234">
  </div>
  <div class="form-group">
    <label>Aktivit&auml;t</label>
    <select class="form-control activity">
      <script type="text/javascript">
        $(document).ready(function () {
          TimeEntryActivities.render("newBookEntry", function (data) {
            console.log(data);
          });
        });
      </script>
    </select>
  </div>
  <div class="form-group">
    <label>Kommentar (optional)</label> (<span class="char-counter">0/</span>250)
    <textarea class="form-control comment" placeholder="Kommentar" rows="5"
              onkeyup="CharCounter.count(this.value, 'form#newBookEntry span.char-counter');"
              onkeydown="CharCounter.maxChars(this, 250); CharCounter.count(this.value, 'form#newBookEntry span.char-counter');"></textarea>
  </div>
  <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-ok"></span> Speichern</button>
  <button type="reset" class="btn btn-default">
    <span class="glyphicon glyphicon-repeat"></span> Reset
  </button>
</form>