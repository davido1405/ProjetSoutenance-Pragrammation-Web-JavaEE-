<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="flex items-center justify-between px-8 py-4 bg-white border-b border-[#E9EAE2]">
      <p class="text-sm text-[#6E6D5F]">Espace administrateur <span class="mx-2">›</span> <span class="text-[#2F3A2F]">Soutenances</span></p>
      <span class="text-sm text-[#6E6D5F] border border-[#E3E1D6] rounded-md px-3 py-1.5">2024 — 2025</span>
    </div>
    <div class="px-8 py-8">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-2">Votre espace, en un coup d'œil</p>
      <div class="flex items-end justify-between mb-8">
        <div><h1 class="text-3xl font-medium text-[#2F3A2F]">Soutenances</h1>
        <p class="text-sm text-[#6E6D5F] mt-1">Organisez chaque soutenance en toute sérénité.</p></div>
        <div class="flex gap-3">
          <button class="border border-[#E3E1D6] bg-white rounded-lg px-4 py-2.5 text-sm">Exporter</button>
          <button type="button" onclick="openModal('modalPlanifier')" class="bg-[#2F5B45] text-white rounded-lg px-4 py-2.5 text-sm">+ Planifier une soutenance</button>
        </div>
      </div>
      <div class="bg-white rounded-xl border border-[#ECEEE6] p-6">
        <h3 class="text-lg font-medium text-[#2F3A2F]">Toutes les soutenances <span class="text-xs bg-[#F1F0E8] text-[#6E6D5F] rounded px-1.5 py-0.5 align-middle">${soutenances.size()}</span></h3>
        <p class="text-sm text-[#9A9886] mb-5">Retrouvez et gérez le planning de la session.</p>
        <form action="${pageContext.request.contextPath}/administrateur" method="get" class="flex gap-3 mb-5">
          <input type="hidden" name="page" value="soutenances">
          <input name="q" value="${param.q}" placeholder="Rechercher un étudiant..." class="flex-1 border border-[#E3E1D6] rounded-lg px-3 py-2.5 text-sm outline-none">
          <input type="date" name="date" value="${param.date}" class="border border-[#E3E1D6] rounded-lg px-3 py-2.5 text-sm text-[#6E6D5F]">
          <button type="submit" class="bg-white border border-[#E3E1D6] rounded-lg px-4 py-2.5 text-sm w-40 flex items-center justify-center gap-2 hover:border-[#5B7A4A]">Filtrer</button>
        </form>
        <table class="w-full text-sm">
          <thead><tr class="text-left text-xs tracking-widest uppercase text-[#9A9886] border-b border-[#ECEEE6]">
            <th class="pb-3 font-medium">Étudiant</th><th class="pb-3 font-medium">Date &amp; heure</th><th class="pb-3 font-medium">Salle</th><th class="pb-3 font-medium">Statut</th><th></th>
          </tr></thead>
          <tbody class="divide-y divide-[#F1F2EC]">
            <c:forEach var="s" items="${soutenances}">
            <tr><td class="py-4"><p class="font-medium">${s.nometu} ${s.prenometu}</p><p class="text-xs text-[#9A9886]">${s.filierelib}</p></td><td>${s.jourSoutenance} <span class="text-xs text-[#9A9886]">${s.heureSoutenance}</span></td><td>${s.sallesoutenance}</td><td><span class="bg-[#E7EFDF] text-[#5B7A4A] rounded-md px-2.5 py-1 text-xs">● ${s.statutsoutenance}</span></td><td class="text-right"><a href="${pageContext.request.contextPath}/administrateur?page=soutenances&modifierSoutenance=${s.idsoutenance}" class="text-xs text-[#5B7A4A] hover:underline mr-3">Modifier</a><form action="${pageContext.request.contextPath}/administrateur?page=soutenances" method="post" class="inline"><input type="hidden" name="action" value="annulerSoutenance"><input type="hidden" name="id_soutenance" value="${s.idsoutenance}"><button type="submit" class="text-xs text-[#B05B74] hover:underline" onclick="return confirm('Annuler cette soutenance ?');">Annuler</button></form><a href="${pageContext.request.contextPath}/administrateur?page=soutenances&detail=${s.idsoutenance}" class="ml-3" title="Voir le détail">→</a></td></tr>
            </c:forEach>
          </tbody>
        </table>
        <p class="text-xs text-[#9A9886] mt-4 pt-4 border-t border-[#F1F2EC]">${soutenances.size()} soutenances <span class="mx-1">·</span> Session de juin 2025 <span class="float-right">● Mis à jour à l'instant</span></p>
      </div>
    </div>

<!-- Modal : Détail soutenance -->
<div id="modalDetail" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <c:if test="${detailSoutenance != null}">
    <div class="flex items-center justify-between mb-6">
      <span class="bg-[#E7EFDF] text-[#5B7A4A] rounded-md px-2.5 py-1 text-xs">● ${detailSoutenance.statutsoutenance}</span>
      <button type="button" onclick="closeModal('modalDetail')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <div class="flex items-center gap-4 mb-6">
      <span class="w-12 h-12 rounded-full bg-[#EFE7F5] text-[#7A4F8A] flex items-center justify-center">${detailSoutenance.prenometu.substring(0,1)}${detailSoutenance.nometu.substring(0,1)}</span>
      <div><p class="text-xl font-medium text-[#2F3A2F]">${detailSoutenance.nometu} ${detailSoutenance.prenometu}</p><p class="text-xs text-[#9A9886]">${detailSoutenance.matriculeetu} · ${detailSoutenance.filierelib}</p></div>
    </div>
    <div class="bg-[#F7F9F0] rounded-xl p-4 mb-6">
      <p class="text-xs tracking-widest uppercase text-[#9A9886] mb-1">Sujet du mémoire</p>
      <p class="text-[#5B7A4A] font-medium">${detailSoutenance.sujetetu}</p>
    </div>
    <div class="grid grid-cols-3 gap-4 text-sm mb-6">
      <div><p class="text-xs text-[#9A9886]">Date</p><p>${detailSoutenance.jourSoutenance}</p></div>
      <div><p class="text-xs text-[#9A9886]">Heure</p><p>${detailSoutenance.heureSoutenance}</p></div>
      <div><p class="text-xs text-[#9A9886]">Lieu</p><p>${detailSoutenance.sallesoutenance}</p></div>
    </div>
    <p class="text-sm font-medium text-[#5B7A4A] mb-3">Composition du jury <span class="float-right text-xs text-[#9A9886] font-normal">${detailJury.size()} membres</span></p>
    <div class="divide-y divide-[#F1F2EC] text-sm">
      <c:forEach var="m" items="${detailJury}">
      <div class="flex items-center gap-3 py-3"><span class="w-8 h-8 rounded-full bg-[#E7EFDF] text-[#5B7A4A] flex items-center justify-center text-xs">${m.enseignantnom.substring(0,2)}</span>${m.enseignantnom}<span class="ml-auto text-xs text-[#9A9886]">${m.qualitemembre == 'President' ? 'Président du jury' : 'Membre du jury'}</span></div>
      </c:forEach>
    </div>
    </c:if>
    <div class="flex justify-end gap-3 mt-6 pt-5 border-t border-[#F1F2EC]">
      <c:if test="${detailSoutenance != null}"><a href="${pageContext.request.contextPath}/administrateur?page=soutenances&modifierSoutenance=${detailSoutenance.idsoutenance}" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm">Modifier la planification</a></c:if>
      <button type="button" onclick="closeModal('modalDetail')" class="border border-[#E8CFC5] text-[#B05B74] bg-[#FBF3F1] rounded-lg px-5 py-2.5 text-sm">Fermer</button>
    </div>
  </div>
</div>
<c:if test="${detailSoutenance != null}"><script>window.addEventListener('load', function(){ openModal('modalDetail'); });</script></c:if>

<!-- Modal : Modifier une soutenance -->
<div id="modalModifierSoutenance" class="fixed inset-0 bg-[#1D2E22]/40 flex items-center justify-center p-6 z-50 hidden">
  <div class="bg-white rounded-2xl shadow-xl max-w-lg w-full p-8">
    <div class="flex items-start justify-between mb-6">
      <h2 class="text-2xl font-medium text-[#2F3A2F]">Modifier la soutenance</h2>
      <button type="button" onclick="closeModal('modalModifierSoutenance')" class="text-[#9A9886] hover:text-[#2F3A2F] text-xl leading-none">×</button>
    </div>
    <form action="${pageContext.request.contextPath}/administrateur?page=soutenances" method="post" class="flex flex-col gap-4">
      <input type="hidden" name="action" value="updateSoutenance">
      <input type="hidden" name="id_soutenance" value="${editSoutenance != null ? editSoutenance.idsoutenance : ''}">
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Date et heure</label><input type="datetime-local" name="date_heure" required value="${editSoutenance != null ? editSoutenance.dateTimeLocal : ''}" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm"></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Salle</label><select name="salle" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm"><option ${editSoutenance != null && editSoutenance.sallesoutenance == 'Salle A101' ? 'selected' : ''}>Salle A101</option><option ${editSoutenance != null && editSoutenance.sallesoutenance == 'Salle A102' ? 'selected' : ''}>Salle A102</option><option ${editSoutenance != null && editSoutenance.sallesoutenance == 'Salle B203' ? 'selected' : ''}>Salle B203</option><option ${editSoutenance != null && editSoutenance.sallesoutenance == 'Salle C102' ? 'selected' : ''}>Salle C102</option></select></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Statut</label><select name="statut" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm"><option ${editSoutenance != null && editSoutenance.statutsoutenance == 'PLANIFIEE' ? 'selected' : ''}>PLANIFIEE</option><option ${editSoutenance != null && editSoutenance.statutsoutenance == 'EVALUEE' ? 'selected' : ''}>EVALUEE</option><option ${editSoutenance != null && editSoutenance.statutsoutenance == 'ANNULEE' ? 'selected' : ''}>ANNULEE</option></select></div>
      <div><label class="block text-sm text-[#2F3A2F] mb-1.5">Étudiant</label>
        <select name="matricule_etu" class="w-full border border-[#E3E1D6] rounded-lg px-4 py-3 text-sm">
          <c:forEach var="e" items="${etudiants}"><option value="${e.matriculEtu}" ${editSoutenance != null && editSoutenance.matriculeetu == e.matriculEtu ? 'selected' : ''}>${e.nomuser} ${e.prenomuser}</option></c:forEach>
        </select></div>
      <div class="flex justify-end gap-3 mt-4 pt-5 border-t border-[#F1F2EC]">
        <button type="button" onclick="closeModal('modalModifierSoutenance')" class="border border-[#E3E1D6] rounded-lg px-5 py-2.5 text-sm">Annuler</button>
        <button type="submit" class="bg-[#2F5B45] text-white rounded-lg px-5 py-2.5 text-sm">✓ Enregistrer</button>
      </div>
    </form>
  </div>
</div>
<c:if test="${editSoutenance != null}"><script>window.addEventListener('load', function(){ openModal('modalModifierSoutenance'); });</script></c:if>

<script>
function openModal(id){var e=document.getElementById(id); if(e){e.classList.remove('hidden'); e.style.display='flex';}}
function closeModal(id){var e=document.getElementById(id); if(e){e.classList.add('hidden'); e.style.display='none';}}
</script>

