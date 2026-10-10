<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Tableau de bord - Administrateur</title>
<script src="https://cdn.jsdelivr.net/npm/@tailwindcss/browser@4"></script>
</head>
<body class="bg-[#F7F8F5]">
<div class="flex min-h-screen">

  <!-- Sidebar -->
  <aside class="w-64 bg-[#1D2E22] text-[#DDE4D6] flex flex-col px-5 py-6 shrink-0">
    <div class="flex items-center gap-2 font-medium text-lg text-white mb-8">
      <span class="w-9 h-9 rounded-lg bg-[#E7EFC9] flex items-center justify-center">
        <svg class="w-5 h-5 text-[#1D2E22]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg>
      </span>
      soutena.
    </div>

    <div class="flex items-center gap-3 pb-6 border-b border-[#2A3F31]">
      <span class="w-9 h-9 rounded-lg border border-[#3A5240] flex items-center justify-center">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg>
      </span>
      <div>
        <p class="text-sm text-white font-medium">Espace universitaire</p>
        <p class="text-xs text-[#9FB89C]">Année académique 2024—2025</p>
      </div>
    </div>

    <p class="text-xs tracking-widest uppercase text-[#7E9078] mt-6 mb-3">Espace de gestion</p>
    <nav class="flex flex-col gap-1 text-sm">
      <a href="${pageContext.request.contextPath}/administrateur?page=tableauDeBord" class="flex items-center gap-3 px-3 py-2.5 rounded-lg bg-[#2F5B45] text-white">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><rect x="3" y="3" width="7" height="7" rx="1"/><rect x="14" y="3" width="7" height="7" rx="1"/><rect x="3" y="14" width="7" height="7" rx="1"/><rect x="14" y="14" width="7" height="7" rx="1"/></svg>
        Tableau de bord</a>
      <a href="${pageContext.request.contextPath}/administrateur?page=etudiants" class="flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M22 9 12 4 2 9l10 5 10-5Z"/><path d="M6 11v5c0 1.7 2.7 3 6 3s6-1.3 6-3v-5"/></svg>
        Étudiants</a>
      <a href="${pageContext.request.contextPath}/administrateur?page=encadreursJurys" class="flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="8" cy="8" r="3"/><circle cx="17" cy="9" r="2.5"/><path d="M2 20c0-3 2.5-5 6-5s6 2 6 5M14 15.5c2.8.3 4.5 2 4.5 4.5"/></svg>
        Encadreurs &amp; jurys</a>
      <a href="${pageContext.request.contextPath}/administrateur?page=soutenances" class="flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><rect x="3" y="4" width="18" height="17" rx="2"/><path d="M3 9h18M8 2v4M16 2v4"/></svg>
        Soutenances <span class="ml-auto text-xs bg-[#2A3F31] px-2 py-0.5 rounded">24</span></a>
      <a href="${pageContext.request.contextPath}/administrateur?page=evaluations" class="flex items-center gap-3 px-3 py-2.5 rounded-lg hover:bg-[#2A3F31]">
        <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="9" r="5"/><path d="M8 13.5 6.5 21 12 18l5.5 3-1.5-7.5"/></svg>
        Évaluations</a>
    </nav>

    <div class="mt-auto rounded-xl border border-[#3A5240] p-4 bg-[#24382B]">
      <p class="text-xs tracking-widest uppercase text-[#9FB89C] mb-2">Session en cours</p>
      <p class="text-white font-medium mb-1">Un cap à franchir.</p>
      <p class="text-xs text-[#B9C2AF] mb-3">Accompagnez les talents de demain, dès aujourd'hui.</p>
      <p class="text-xs text-[#D8E4A6] flex items-center gap-1.5"><span class="w-1.5 h-1.5 rounded-full bg-[#D8E4A6]"></span>Session de juin 2025</p>
    </div>

    <a href="#" class="flex items-center gap-3 px-3 py-2.5 mt-4 text-sm rounded-lg hover:bg-[#2A3F31]">
      <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><circle cx="12" cy="12" r="3"/><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 1 1-2.83 2.83l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 1 1-4 0v-.09a1.65 1.65 0 0 0-1-1.51 1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 1 1-2.83-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 1 1 0-4h.09a1.65 1.65 0 0 0 1.51-1 1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 1 1 2.83-2.83l.06.06a1.65 1.65 0 0 0 1.82.33h0a1.65 1.65 0 0 0 1-1.51V3a2 2 0 1 1 4 0v.09a1.65 1.65 0 0 0 1 1.51h0a1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 1 1 2.83 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82v0a1.65 1.65 0 0 0 1.51 1H21a2 2 0 1 1 0 4h-.09a1.65 1.65 0 0 0-1.51 1Z"/></svg>
      Paramètres</a>
    <a href="${pageContext.request.contextPath}/logout" class="flex items-center gap-3 px-3 py-2.5 mt-4 text-sm rounded-lg hover:bg-[#2A3F31]">
      <svg class="w-4 h-4" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.5"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"/><path d="m16 17 5-5-5-5"/><path d="M21 12H9"/></svg>
      Se déconnecter</a>
  </aside>

  <!-- Main -->
  <main class="flex-1">
  	
  	<jsp:include page="${cheminContenu}" />
  	
  </main>
</div>

<!-- Modal : Planifier une soutenance -->
<div id="modalPlanifier" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <div class="flex items-start justify-between mb-6">
      <span class="w-11 h-11 rounded-lg bg-[#E7EFDF] flex items-center justify-center"><svg class="w-5 h-5 text-[#5B7A4A]" fill="none" viewBox="0 0 24 24" stroke="currentColor" stroke-width="1.8"><rect x="3" y="4" width="18" height="17" rx="2"/><path d="M3 9h18M8 2v4M16 2v4"/></svg></span>
      <button type="button" onclick="closeModal('modalPlanifier')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <h2 class="text-2xl font-medium text-[#2F3A2F] mb-1">Planifier une soutenance</h2>
    <p class="text-sm text-[#6E6D5F] mb-6">Un étudiant, un créneau, un jury. La prochaine étape commence ici.</p>
    <form action="${pageContext.request.contextPath}/administrateur?page=soutenances" method="post" class="flex flex-col gap-4">
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Étudiant</label>
        <select name="matricule_etu" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm">
          <option value="">Sélectionner un étudiant</option>
          <c:forEach var="e" items="${etudiants}"><option value="${e.matriculEtu}">${e.nomuser} ${e.prenomuser}</option></c:forEach>
        </select></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Date et heure</label>
        <input type="datetime-local" name="date_heure" required class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Salle</label>
        <select name="salle" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm"><option>Salle A101</option><option>Salle A102</option><option>Salle B203</option><option>Salle C102</option></select></div>
      <fieldset class="border border-[#E3E1D6] rounded-lg p-4">
        <legend class="text-sm text-[#2F3A2F] px-2">Membres du jury <span class="text-xs text-[#9A9886]">2 minimum</span></legend>
        <c:forEach var="en" items="${enseignants}">
        <label class="flex items-center gap-3 py-2.5 text-sm"><input type="checkbox" name="jury" value="${en.matriculEns}"> ${en.nomuser} ${en.prenomuser} <span class="text-xs text-[#9A9886]">${en.specialiteLib}</span>
          <select name="qualite_${en.matriculEns}" class="ml-auto border border-[#E3E1D6] rounded px-2 py-1 text-xs"><option value="Examinateur">Examinateur</option><option value="President">Président</option></select>
        </label>
        </c:forEach>
      </fieldset>
      <div class="flex justify-end gap-3 mt-4 pt-5 border-t border-[#F1F2EC]">
        <button type="button" onclick="closeModal('modalPlanifier')" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm">Annuler</button>
        <button type="submit" class="bg-[#2F5B45] text-white rounded-lg px-5 py-2.5 text-sm">✓ Confirmer la planification</button>
      </div>
    </form>
  </div>
</div>

<script>
function openModal(id){var e=document.getElementById(id); if(e){e.classList.remove('hidden'); e.style.display='flex';}}
function closeModal(id){var e=document.getElementById(id); if(e){e.classList.add('hidden'); e.style.display='none';}}
</script>
</body>
</html>

