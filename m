Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A6D305E3B
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 14:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782828777; cv=none; b=TWQfzeqhtx2yxRb3iJdqZlKK9q/ifZppv7RAYNNAxkD7JHjwvb5e+b8NapM2kxXfb6g7hCX7I9Y2jqbL2wrKBOau9TwUIyiWkiPAs/hA8bW/bi5bk1NrlSO/J3KOKCe0E7e0Gw9eBsLERk6kh7wO8ikqj3rMfm9rxa2eQI6l5vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782828777; c=relaxed/simple;
	bh=42YONAod2lAk7xUe6I7fcrmgkxViFYXEB0Fjs5O421I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=XZzqC8bPVuX9DoUJpWgMEnBa13aY2vZst4iLQI9OIu5EETu6avqGWqkiTcc9q7L3FztJeRVZX1Ygj8xDkpXGV2chydwpZpkFPP3FnUUAnJmSpIwP6j0t7BhSPbVtLvvItke1yKjonLv/b8wxHD4xeEcEA5krqVRg4TkW3E7ogTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cHvNDKvx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cHvNDKvx"
Received: by smtp.kernel.org (Postfix)
	id 0A2781F00A3A; Tue, 30 Jun 2026 14:12:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E00A91F000E9;
	Tue, 30 Jun 2026 14:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782828775;
	bh=X5AANzelYr6tNN1PJ8OBcXlSMllO6zSLMNtcgkChsUI=;
	h=From:To:Cc:Subject:Date;
	b=cHvNDKvxRriL/njV8Tmfncgg+7GGqMV/cvp7eJzyIjnZqaLE2LTQ4F5fR48S9XESd
	 M5E9foylWnASg1ogjAV9AaTm0/q2WGsberlQAaM2MJN+1t2JjSzZbc47eMu7TKbvEd
	 7PbhMcWXQUSJJ0JwkSbJ38GOYJW7RKlnyr7fxNmdNRtGIL/Kkg9YWUS+FANs3Jd4L7
	 DAnKi3A1ifnWbfgpcQuDl0EWqomLvK85M3c3d9AHEFMMJTPrJg+3ZgTYrgmZkq59e6
	 oD488jXbdcETJMT5jPU5rMRTXNvyjzVdE0Af46c0SLoqXTXMgU16mDbDpU8gVsfEeJ
	 MPIH2yw4P+tHw==
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Christian Brauner <brauner@kernel.org>,
	"Kernel.org Tools" <tools@kernel.org>
Subject: b4 review tui + lore/lei/korgalore
Date: Tue, 30 Jun 2026 16:12:47 +0200
Message-ID: <20260630-einhundert-bauamt-atemlos-5b92514a1443@brauner>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6423; i=brauner@kernel.org; h=from:subject:message-id; bh=42YONAod2lAk7xUe6I7fcrmgkxViFYXEB0Fjs5O421I=; b=kA0DAAoWkcYbwGV43KIByyZiAGpDzuOh7a0B/s/dGbtRdb22cxewhfxAy0s+tUwhrAUsJQ/SY Ih1BAAWCgAdFiEEQIc0Vx6nDHizMmkokcYbwGV43KIFAmpDzuMACgkQkcYbwGV43KLPtgD/ZFWI K+ozi5ZD5+AYXpm6bVvwWe9u6ptnoWehmgg2jC4BAP6XFO69qtSiK2o9mIa00SfglfZAZZdwkU3 4KbZk+eEO
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hey Konstantin,

So I've now been working with b4 review tui exclusively for a while and
have added a bunch of extensions that put it on steroids for me. In
place merge conflict resolution when applying individual patches or
series is just "chef's kiss".

I also do like the patchwork integration which is very nice and allows
me to pick series from patchwork into b4 review tui without much effort.

One thing that I'm missing is a companion to the patchwork app
integration for mailing lists. Here's what I mean. I want to be able to
browse a mailing list the same way I'm browsing the patchwork app ('p')
in b4 review tui, then mark them as "tracked" etc (ideally it would
de-duplicate by message-id or something between the patchwork app and
the mailing list.

I'm not well-versed enough in lore/lei/korgalore to find the correct
integration point for this so this makes sense.

Here's some proposals that I came up with talking to an LLM:

The shared idea (both D and C)

Both add the same feature — a browse-and-pick LoreListApp (a lore-native
sibling of the Patchwork browser PwApp): it lists new patch series
discovered from lore mailing lists, you eyeball them, press t to enroll
one into the existing review tracker. They share the entire spine and
differ only in the transport that produces messages:

- The seam is a List[EmailMessage] → _get_lore_series → add_series_to_db
  (b4 already owns all of this).
- A lore_scan.py series-scanner: LoreSubject finds [PATCH vN m/n] roots
  → get_strict_thread groups → find_existing_change_id dedups → emits
  candidate-series rows.
- Entry wiring: a LORE_SENTINEL + g binding in TrackingApp, and
  run_lore_tui in _entry.py, exactly mirroring how p opens Patchwork.
- Tracking reuses add_series_to_db with pw_series_id=None (identity via
  change-id/fingerprint).

Option D — native public-inbox git

b4 mirrors and walks the lore git repos itself. Transport is
lore_mirror.py, a port of korgalore's pi_feed/lore_feed: fetch
manifest.js.gz → auto-discover v2 epochs → git clone --mirror →
incremental git rev-list {cursor}..HEAD → read each commit's m blob →
parse → scan into series. Per-epoch OID cursor + rebase-recovery for
when lore repacks.

- Pros: fully self-contained and offline, zero external tools, replaces
  l2md outright; the public-inbox reader is upstreamable into the shared
  liblore later.
- Cons: b4 carries ~1000 lines of git plumbing;
  subsystem-by-touched-file discovery (fs/**) isn't free — by-List-Id is
  easy, by-file would need local indexing.
- Note: plan.otl already has a v0.17 "Auto-consume / b4 review consume"
  item that instead delegates the walking to korgalore's pipe target — D
  is the b4-native-walk alternative and should reconcile with it.

Option C — lei-backed

b4 shells out to lei (public-inbox's local email interface). Transport
is lore_lei.py: build a query (l:<list-id> and/or dfn:<glob>
touched-file), run lei q -I https://lore.kernel.org/all/ -t -o
<maildir>, refresh incrementally with lei up, parse the Maildir → scan
into series.

- Pros: least new b4 code; gives server-side dfn: touched-file search —
  "show me every new series touching fs/**" — which is the maintainer
  superpower Patchwork can't match; korgalore already proves the
  pattern. No local mirror needed (queries lore over HTTP).
- Cons: runtime dependency on lei being installed/configured; hybrid-online.

┌───────────────────┬─────────────────────────────────────┬─────────────────────────────────┐
│                   │           D — native git            │             C — lei             │
├───────────────────┼─────────────────────────────────────┼─────────────────────────────────┤
│ Transport         │ b4 walks v2 epochs (lore_mirror.py) │ shell out to lei (lore_lei.py)  │
├───────────────────┼─────────────────────────────────────┼─────────────────────────────────┤
│ External dep      │ none                                │ lei                             │
├───────────────────┼─────────────────────────────────────┼─────────────────────────────────┤
│ Offline           │ ✅ full                             │ hybrid (HTTP queries)           │
├───────────────────┼─────────────────────────────────────┼─────────────────────────────────┤
│ Subsystem-by-file │ needs indexing                      │ ✅ free (dfn:)                  │
├───────────────────┼─────────────────────────────────────┼─────────────────────────────────┤
│ New b4 code       │ most (~1000 lines git)              │ least                           │
└───────────────────┴─────────────────────────────────────┴─────────────────────────────────┘

I don't think I can work on this but I would really love to see a variant of this happening.
I'm not tied to any specific form I just want to get the idea of a
mailing list/mbox/lore/korgalore/lei type browser app like the patchwork app in b4 review tui.
I think that would be an absolute killer feature.

Thanks!
Christian
