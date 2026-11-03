Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730820;
	b=ZXifdLC2Cx04FyK+i/uE1syt5zbdYpyTYVh7F6FeUX2aMpCbYEDcToyqLAq6uKJUG/qB
	 WcC91b17fXptjyzH7p0zAEfi161e+dxFOAuIAB+FtH5/sq2PsvUJDG4z5u3awLKcgHv8b
	 B9ph58LSWfJMfnQlFJivCPv2u9VLhOwlKCwyDby7//XaYlPHXIopuDPyrkSg9oNSJVWO4
	 vZzj4KWvlTiCitgaZ5NNH3lMZUdxOJS7pAtTHpS9KguMyZcnGc5zC0BvwgSHj3go5q6PZ
	 rW4D5fYzA/ygvg3oLQIIoJ5q4HPBX4wv/OQ3S3sudzi9E9VFqAMs8zXV+qNeubxvywA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730820;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=OYywYniPIgOqGPHrdBOd4J/3uan7F8CZPk7bHmVwOAU=;
	b=GgkEr0GPPC6b1Q+sgyVi5jVdVtorK8TN23G/6oNZEx/bGvAE4GCVNz1U3j29jQ7KACIR
	 9qSYbeNpHlQt5X2+VV22uElWow+TY/t/q8CcF4wL2s2U7IT28V/KVp3DklMb72iXNK2UU
	 qT6xn/gtroD7ty9CkY3MsP03nDQjeuqZBOGz67yUdyT+8ZubccarbqBH+VO75K7hLbYKh
	 JrlpU2nnQjJWERQfmwaHUekmyWqj95Bd1bzkS/URzIrseowztmLnx6mUhsMV2o0al5POb
	 S0K6AnNl5RkdoOOGnH67xvNsrzcp3/CL1CdE/4HyXboCuITFbhh9Lai8uSk56whWl9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vejggel2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F40F606A326
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 18:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vejggel2
Received: by smtp.kernel.org (Postfix)
	id CB2EB1F00A1F; Tue,  3 Nov 2026 18:33:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793730819;
	b=kvfUCBzPuA6P9vbzxw/9GEogeTXyedD2acWwfl6XnAzINBouh3qnKV4RPrOu3fUnOdq4
	 0i0BXxdL44kb8Oh3DnSLabEgEBFaVcGc+zpayrFcM6AMC14uYMFUEslv2901+9GxIlALq
	 bhBv0DSISAkXfwziG4D3lvrR/oQju6PEPPWz2MZ4eKl8Blx3bKV1zLF2LPBJykhTi+6Wu
	 yCvEUuMYCO5CXp5+gHtLddYj3i9lz+NBro0Sd03T95xl5CfQt+82ePyIYoJB0hmGZxUy6
	 qdnjEcMamPkcBzVnD1/e9MAQaoYE5DUCfoP7Rr1j0xNAS6rpRVTU+lENpDPiUY5u74g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793730819;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=OYywYniPIgOqGPHrdBOd4J/3uan7F8CZPk7bHmVwOAU=;
	b=nQ8LHxpNYgWoDFQ2T6rmahxqJnkA89ofsms3oWHRjOfOKqPJNtv6a+niqAhuHXJTzppa
	 gVEbMFIJyBRWrULqEtuDHKf4a60GA1QFMZzdGfEqkr3WHxD7Ov8nVYt8gnZw/1ztpckjK
	 RQoZoy9Bz8YkMx11tjohoSBItBEpm4Je0so+7qYTbJhCGpAxyOfHESJKVww9iF19wnWMb
	 5gn5xRAVluxQEClQ6GY1wwhEJdTfcS2oqm8UANc0RyZaDrms7A6n+9wMVdvBJAu9VnSkj
	 LM6oKu02prFG5esuTkOc0h/azgrcFUXhtX9/5fMNpxFEv2ayiPT32CD0a8AoisYvGNA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vejggel2;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 39D0C1F00A22
	for <tools@kernel.org>; Tue,  3 Nov 2026 18:33:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vejggel2
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 39D0C1F00A22
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso36973485e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 10:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730817; x=1794335617; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OYywYniPIgOqGPHrdBOd4J/3uan7F8CZPk7bHmVwOAU=;
        b=vejggel283N3sXUBVe/W23DqjbEhO1GG9Duq/pKCgY2G4KvtzuiRxNRXLI25V/vrW2
         gjyLWnjX8nls4wejLRe8xeI2oTxFnh0L9qzgx3CkKTp07C+So8pUpSpisvvby3GfhQ+M
         CbkGUWlk7/00hAoV+CHUUdjeo465SqD3y2QB6jdjsz1h7i+Cm84H9xm2CreYumfty4Xa
         Zf8+zXLldynWlX0lSQvndq9kcE7LElOHmukUOiq+US+Vw+n0xzsU+dwWHAMPiBYw8JQH
         95oltFS7oEOQNSt57Kdek0vsKbbkvW7GEMpWT13x/8DEcTadf667jxK5L56nWg52rtca
         lW1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730817; x=1794335617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OYywYniPIgOqGPHrdBOd4J/3uan7F8CZPk7bHmVwOAU=;
        b=22H1M6F1lGYOYJS/9v/z98Kq3x+Po748eAUfkK3BVn/NltYYKX5mWMby5JcBTt63wg
         opeOTubdCD7pAm2HRHQyNIgWNUOvheOVj9fu5qE3pol6gfUJTPESbLn5IjwONrVGPaLo
         980mS41faO9WAwPatZs7UdgHcEcKRQccPrNqdh4Eih1T9fciHbiTX6IJeg/Snz1Iu52p
         4MpQrePgcXjqbwwdVUMXQfWf0+qcQH+GxqnRi+4lSXk+2skUp/DGrDBKcBpwiOY8/r2D
         Odu+0oqqgi4nEaj0nsebJzGFMjbfzFeh025PQ1OL+shImWzYcMOwgazrB5pLVlCuRtBv
         rd4g==
X-Gm-Message-State: APuU4Z8AZguNIn8BtK3cKAMXJp0af7eduIVXxZgaQEBzJLODSy4WLP+5
	t87q7DSZHF0sjGhfW5GdTiiBnKGH9Iqf0aRiEIEkLYy6q4XRqzCyUvrr7wmOUnsO
X-Gm-Gg: AYBFou3cWUUvncoshfL4xT1tvsYtHo+OtRItVsn2Ad52nthULrlr7RtIM8+KVtUnUSy
	0eqMRCC+8XitITQUsQ1L38DYT+imYOJOys9e9i1fNK7aeSAxunEz7b0KP5Z9NKbefH4yT4W52d8
	3meD96Xpg0W19JkDWWpwf6rT7nhdyC2v1Irwy+3+GzkPkw3NM27HXH1/6UH98nX37jBVvTL0ln0
	qxESokQlD6D7FblZl4kisDip6Ydng/NAg+eBjbi7p1v8fPj9x18eEAYGsXNHPOAflzT+SIlnq8T
	1fOcq952qjomGg5insjWCEtFn3dixeSCvqIiKtfqTpf0REqf5bSaySGzzTVTTS6hr5m4sDDam46
	vxhgpqKAmcWSVxJ5s6sbXX12/MIPZEurhPXm4dxHE1ahpj8wGgfnM7EzreFQxTFZKkgJ2/rY2b9
	RTP2b1yGbH81xpWokug8mWOKx9mPxWPZwvqD4fueJk9hGJ2irndzlqdEanIfFRa9RVawimATUTo
	Pwgs+L/R5FOcBUjwfnxF5gD5W9Lv7UCJY9coV6Sn89w2kHIBy0jFGyDvU6Bl7Cqnq182s6uLJX1
	sPBYA8ym0bTqRYXV2fWv8iltwPZiy0JXHgCszAhhVTedhs9JVtdDorDknbx3f6fZTok=
X-Received: by 2002:a05:600c:4e11:b0:4a0:eae0:769a with SMTP id 5b1f17b1804b1-4ac185bc7d0mr311238385e9.28.1793730816570;
        Tue, 03 Nov 2026 10:33:36 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f00sm1749315e9.2.2026.11.03.10.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:33:36 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 19:33:34 +0100
Subject: [PATCH b4 3/4] review: preserve follow-up view position on reload
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-view-follow-ups-threaded-v1-3-11c2e2211a9f@gmail.com>
References: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
In-Reply-To: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793730813; l=6780;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=cIA4/NPGpcpr82N8wL4MW2FVu7Z6eKDw0W5OyBWnrzE=;
 b=GIb3wSDHkwsY42HyL+BzyavS2zWr/K3xvvIn5Ndn03WjyZpm8NhyHNTeO3hg5LD8K0x+RdKYr
 AQZDd5poHlSCqMjssTaxkzdti86s3lbnzR0gh9xv6FuwY8Gd+BZ9Dls
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Rebuilding the patch list can deliver another highlight event for the
same item, resetting the viewer position. Avoid reselecting the current
item and retain the scroll position and selected reply across reloads.

This keeps a reviewer in place when follow-up data is updated.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/review_tui/_review_app.py | 20 +++++++++--
 src/tests/test_tui_review.py     | 74 +++++++++++++++++++++++++++++++++++++++-
 2 files changed, 91 insertions(+), 3 deletions(-)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index 0e5fc6b..39ac7bd 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -1094,9 +1094,14 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
         """Handle patch highlight change in the list view."""
         item = event.item
         if isinstance(item, PatchListItem):
-            self._show_content(item.patch_idx)
+            if item.patch_idx != self._selected_idx or self._selected_followup_msgid:
+                self._show_content(item.patch_idx)
         elif isinstance(item, FollowupItem):
-            self._show_followup_item(item)
+            if (
+                item.display_idx != self._selected_idx
+                or item.msgid != self._selected_followup_msgid
+            ):
+                self._show_followup_item(item)
 
     def _show_followup_item(self, item: 'FollowupItem') -> None:
         """Show the parent patch for a follow-up item and scroll to its comment."""
@@ -2016,6 +2021,10 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
     def _load_followup_msgs(self, msgs: List[Any]) -> None:
         """Parse msgs into follow-up comments and refresh the display."""
         cover_msgid = self._series.get('header-info', {}).get('msgid')
+        selected_followup = self._selected_followup_msgid
+        viewer = self.query_one('#diff-viewer', RichLog)
+        scroll_x, scroll_y = viewer.scroll_x, viewer.scroll_y
+        old_followup_position = self._followup_positions.get(selected_followup or '')
 
         # Minimise for body parsing (strips deep quoting, signatures)
         minimised = b4.mbox.minimize_thread(list(msgs))
@@ -2124,6 +2133,13 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
             self.notify('No follow-up comments found')
         self._populate_patch_list()
         self._show_content(self._selected_idx)
+        if selected_followup and selected_followup in self._followup_positions:
+            self._selected_followup_msgid = selected_followup
+            if old_followup_position is not None:
+                scroll_y += (
+                    self._followup_positions[selected_followup] - old_followup_position
+                )
+        viewer.scroll_to(x=scroll_x, y=scroll_y, animate=False)
 
     def _integrate_followup_inline(
         self,
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 0236cc9..c463f47 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -21,7 +21,7 @@ import pytest
 
 pytest.importorskip('textual')
 
-from textual.widgets import ListView
+from textual.widgets import ListView, RichLog
 
 import b4
 import b4.review
@@ -414,6 +414,78 @@ class TestFollowupReload:
         assert len(app._patches[0]['reviews']) == 2
         save.assert_called_once()
 
+    @pytest.mark.parametrize('select_followup', [False, True])
+    @pytest.mark.asyncio
+    async def test_reload_preserves_selection_and_scroll(
+        self, gitdir: str, select_followup: bool
+    ) -> None:
+        change_id = 'followup-reload'
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir,
+            change_id,
+            ['patch 1'],
+            series_extra={'header-info': {'msgid': 'cover@example.com'}},
+        )
+        patch_id = f'{change_id}-patch1@example.com'
+        messages = [
+            make_msg('cover@example.com', '[PATCH 0/1] Test series'),
+            make_msg(
+                patch_id,
+                '[PATCH 1/1] patch 1',
+                body=MINIMAL_DIFF,
+                in_reply_to='cover@example.com',
+            ),
+            make_msg(
+                'review@example.com',
+                'Re: [PATCH 1/1] patch 1',
+                body='\n'.join(f'Review line {index}' for index in range(80)),
+                in_reply_to=patch_id,
+            ),
+        ]
+        app = ReviewApp(_build_session(gitdir, branch))
+        async with app.run_test(size=(120, 30)) as pilot:
+            app._show_external_comments = True
+            app._load_followup_msgs(messages)
+            await pilot.pause()
+            patch_list = app.query_one('#patch-list', ListView)
+            item = next(
+                child
+                for child in patch_list.children
+                if (
+                    isinstance(child, FollowupItem)
+                    if select_followup
+                    else isinstance(child, PatchListItem) and child.patch_idx == 1
+                )
+            )
+            patch_list.index = patch_list.children.index(item)
+            await pilot.pause()
+            viewer = app.query_one('#diff-viewer', RichLog)
+            position = app._followup_positions['review@example.com']
+            viewer.scroll_to(y=position + 10 if select_followup else 20, animate=False)
+            await pilot.pause()
+            before = viewer.scroll_y
+            assert before > 0
+            visible_line = viewer.lines[int(before)].text
+            earlier = make_msg(
+                'earlier@example.com',
+                'Re: [PATCH 1/1] patch 1',
+                date='Mon, 23 Mar 2026 11:00:00 +0000',
+                body='An earlier review.\n',
+                in_reply_to=patch_id,
+            )
+            app.call_later(app._load_followup_msgs, messages + [earlier])
+            await pilot.pause()
+            new_position = app._followup_positions['review@example.com']
+            assert new_position > position
+            assert viewer.scroll_y == before + (
+                new_position - position if select_followup else 0
+            )
+            if select_followup:
+                assert viewer.lines[int(viewer.scroll_y)].text == visible_line
+            assert _selected_followup(app) == (
+                'review@example.com' if select_followup else None
+            )
+
 
 class TestFollowupTree:
     def test_tree_keeps_orphans_and_breaks_cycles(self, gitdir: str) -> None:

-- 
2.43.0

