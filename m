Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793716196;
	b=vjD3l8n40hsmBPA0M+W60hKJrue+j1IsNfYXePRHyfKwZOrTwKJDvpDoazxsp4VwjR0k
	 mAb/kw6y4pwi2bQx854VdTXVjgtZtKPw8WPsqs/52woKeW0Tkkt/lIay9aBI6g2RO4t6M
	 J+dxY03Zc9uPTY+1Z8O6DkKkQShejhkXIAujvnbUvDrdR4vsEt9XHwJs/ZQ10DzIR7bx9
	 ilnIyJYv4MwJS2CGXJb4AirSPKTt/J0bJRvyADGmkVBUqWVi+eMcrM8sXs9c7ox1h3KE0
	 WM/ZKzqqrxJce4MnDvgjRfKuVtS1XMGlk72yvVM/bDgm2wdp0E4EtS9SOqDDkGYNzvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716196;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=J6AaqQfdfiWSMbc8fjtRkaX6c8kr5mSc8qlcO/8+K5A=;
	b=wp+N6SObUnOZX5tByeD/c14xtCFjPaVKSCsV6OBdGR+W8frFARs4SKRzVYndAs0yyBML
	 3fDqNIUgvtW1sS2cbn6pn2YZ76TdhbeuNpDBVM2qtfroqVF5BAp4DCOH1cxarEvUmSj98
	 G/b4kAOlDTxdcMWr9c4hZf1a7XblIxBAtJQcY6NlWiRneLJuVcVLesxuMknSgP6F4AQMT
	 hIBsp+i4EE719vJD2oMiNb07pOqA15R6t+AQefBqLvB359Q8Arj/iO9ZSzDwqEQavjEfv
	 LpemN1wLlkLQFLYw4X9qPTnCXWGhayj0hum3A0VFB88RgFxjVwT+Q9pSDWIVzRd+UgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6pI7eQR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB044606A33A
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 14:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6pI7eQR
Received: by smtp.kernel.org (Postfix)
	id BD3ED1F0093A; Tue,  3 Nov 2026 14:29:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793716195;
	b=MbfAmOMUgpisVp0UlISJbg8JYfDVnjS0BRzG9Mg/eMVI9F0XjlZHAQEHVl5DqQBOejfT
	 1p+UW4830PROm1tqwsLqF6cyxMvSnBU1gZTw2Ju/bwJ58MPqBbDV6vadBRULPNI3hWmYj
	 78bcadMSbbe+qIzw/iOOgsGpo51TiGQM5gGJfMW8gdcfHOCLb6kOWaGwQ0oDT1IgD7CzJ
	 bz3RaVfVec+SCRk4AcWeQi/QibTJeWEKYFdu63173kcywPOPq3gUbG2uLDMCjsaolLYJI
	 YZDb37JutuD2vPMZ+7E+fn+ndrDDTSYXiatiByHYxl0hrQC0ZBchgwZXTlIS3F0U4jw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793716195;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=J6AaqQfdfiWSMbc8fjtRkaX6c8kr5mSc8qlcO/8+K5A=;
	b=W61yVeAM+edYwcHm+eloWZvLa79K7KjpxjM6Grtvjybp/CbO5BI/cG+JcqA3X+hm80FC
	 KUBbhvOYRETeZJYKwW2NLpEgL96F/x4868HPnsah2YxRQNq/9iw+yBoT5TGAZdBgSm0Gl
	 YWBx2REZ0XFxwwOy5nUO33cYvyUCs1LbhUSK9fTOQEjAhyYtMeh4C34B4BFJif6lSxQyi
	 qOblmaHlmgBGG6OzfncNmFPi54Y956PWweyHmCdADg7ZSbxTTgl2lE3AvSvGatOh2EPPk
	 KC6CYLdhPM7Ck83KKJB9hnGrMXwC1TxkVd+RNsAa9eJEh5L2EgN30W5HTnsSlfnYTzw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6pI7eQR;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 49A051F00A15
	for <tools@kernel.org>; Tue,  3 Nov 2026 14:29:52 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s6pI7eQR
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 49A051F00A15
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso34750415e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 06:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793716191; x=1794320991; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J6AaqQfdfiWSMbc8fjtRkaX6c8kr5mSc8qlcO/8+K5A=;
        b=s6pI7eQR0YbF1dywtTsxzkhq+lkXieo6NSYXI3PonTWlppDTJcFSwnByNb6SyHnRKo
         KL/Rak4kwWsN7Ieqcl//UPZY0JdA+Wp8NRyanZjUsvf7XNayUQNbIsnRTjOyjaNCS/8B
         TsuRas/IdReArkGqQ/QmsYakbNTGf+BaM4ooTMo3yZsjvl5urUU0ItyHHWRtBTCTkkLd
         +LazjkzZYvv3DtSxVVQGSzgHYaPXZG9YM/ZstIVltcZ4KjK/FjIojHTJvZ/72yjgwluF
         yNVp1GGWuAD0sj9a/gyL3Lec9wd+rxK4Vd4x6jXtKRLiGXIRkYleYObD7llF7YG7t9ZH
         NRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716191; x=1794320991;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J6AaqQfdfiWSMbc8fjtRkaX6c8kr5mSc8qlcO/8+K5A=;
        b=Pxa2Q9fzTVY2TmGk3yJeDhv/yB/oYdUEuJ61vIqUZvF3CgtJoBc6+WB5jV7iLaoXeU
         KmUuPUFsRO4FQ6iowfsSB6D8NU7LbZPMKvyRLZ5JD4KV9SyF0EjINb7vP1UgxmKWQRhl
         i29nYucww9iqEweUAQvhEuOAt0iTezw00XqMVthFP3XCZjTZ/b02n6BHzn6f5G8bJi1E
         lDgNks7TTeS4p396FC+pZbIxVKhDL7TrxOPCeoH4AB0zBhwhGm3OSwhO5nsRSooiYyXN
         hwVcmDxgEdwpQYdasUhliPI3+tzXolg/FDhfqK35Vf1uHcN5IbYJ3EQascnPzqMadKCk
         7g5g==
X-Gm-Message-State: APuU4Z9twB4mMRaTsf+vNHTGJHD0ktXmna8yij7FSb+DOD9jMlurCm5D
	5GzqQGaoDjO+bm5AfzuPSAG+0QrXJ0xllz4DrpV0ZaOJ8AXP6l0bQdz/
X-Gm-Gg: AYBFou2xMI3HzPbZeqTEIqFY4MeCuU9xaq/cTj/LBX3YQY7xjvVbPg6MCD/sERPyGi/
	i9fvmmSSL9ua3+91fIjs2bdsOq077WVmAv0YQc84yzWCThQAH2nu4JNp/uGzLRMyALILUBGGtVR
	sEeb8Sl81l4ecEiogLtnOeb6aM4r2xolgCc4pJ3pDs2EWuSjQhFQX1FwCPfL3HoiRdTTIRcnBmh
	ugBIt4Mx27lYFgEKHVg5LP3UC9oi6nhUdIjee4N8zazyIwjPMBBYjo8HfGEaxHxjj61BSbAeLHd
	HCWVlEjD8B9vb3ramVmvEAET3QExZFuZsM9zI5BJO2/n32kIKyeWzDWZ1M2tqVDv3lXAQYrHRh0
	bOUQbFD+sgP5XURwEhjdbUs63H3AoM9vl3Rqzwrv5pqnVmbosHY3rUQbnkwe4to8pwAPnp/RA7t
	6DxLEGWBiynLDsMKPNJ2CpJcXiKJV/8W2Srm03bUiS9B3a0fjQYmRoWennESYccydwWhqVqAO/A
	pgEH7SR5kxAaHYv1y74FasGoyhiYaOr4Dbwz0dsBv24TBWXvu62tQ9vj+rdHmK3gmoOVY7tm4u0
	I1tysDvGKfK9Ud2ouywAraZHZ/CS5BSriRP46Pzocf0xwvU1ahLPn06PYD0Ugl+VIUw=
X-Received: by 2002:a05:600d:e:b0:4ad:181a:4355 with SMTP id 5b1f17b1804b1-4ad181a44b6mr193725785e9.26.1793716189883;
        Tue, 03 Nov 2026 06:29:49 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a96fc933sm65290805e9.11.2026.11.03.06.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 06:29:48 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 15:29:38 +0100
Subject: [PATCH b4 5/5] review: Edit tracked series in the TUI using the E
 key
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-browse-and-track-series-v1-5-d9c9306f4033@gmail.com>
References: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
In-Reply-To: <20261103-browse-and-track-series-v1-0-d9c9306f4033@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793716179; l=104238;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=QuvSZfgVHFmQITYLYKVro3NifOO88Y2xewE0/P0Do54=;
 b=x9rjTPz9LdjczSz1YXeAUcThQqxJ8jf4dBwXG4KHgPMg00AaYG1Fp51GApJ+SGb03U5NbtovG
 y7m5YzsBd5fBO1r4oLQxHQGdzBR0DLmnJlmvIJuxD0bFxOufdwLq9yj
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Adding submissions to the tracking list requires leaving the TUI and
running 'b4 review track' with a message ID. Reviewers may also want
to abandon several tracked series together when cleaning up the list.

Add an edit screen, available with the E key, where reviewers
can browse Lore submissions, select series to track, and abandon
multiple tracked series in one operation without leaving the TUI.

Assisted-by: LLM [codegen, tests]
Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 docs/maintainer/review.rst         |   17 +
 src/b4/review_tui/_modals.py       |  889 ++++++++++++++++++++++++-
 src/b4/review_tui/_tracking_app.py |   48 +-
 src/tests/test___init__.py         |    1 +
 src/tests/test_tui_tracking.py     | 1267 +++++++++++++++++++++++++++++++++++-
 5 files changed, 2219 insertions(+), 3 deletions(-)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 5a3e9d9..5a9e5c4 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -182,6 +182,7 @@ Symbol   Status
 Key           Action
 ============  ===========================================================
 ``Enter``     Enter series (reviewing) or open action menu (other states)
+``E``         Edit tracked series and browse Lore submissions
 ``r``         Review — create or re-enter the review branch
 ``t``         Target branch — set or clear the per-series target branch
 ``c``         CI checks — run configured check commands and show results
@@ -210,6 +211,22 @@ Key           Action
 ``Q``         Quit
 ============  ===========================================================
 
+Press ``E`` to edit tracked series and browse submissions from the Lore
+archive configured by :term:`b4.midmask`. Tracked series start selected;
+use ``Space`` to toggle a series and advance to the next row. Apply the
+changes to track newly selected submissions or abandon deselected series.
+Abandoning requires confirmation and deletes review branches and tracking
+data, just like the abandon action in the tracking list.
+
+The list is ordered newest first. Lore submissions load in the background;
+press ``Enter`` on the load-more row to fetch older submissions. Search by
+subject, submitter name, or email to filter tracked series and Lore results.
+Tracked series and newly discovered revisions follow the same tracking
+and deduplication rules as ``b4 review track``.
+Revisions without a change ID are grouped when their thread, sender,
+subject, and revision numbers identify them as the same series; otherwise
+they may appear as separate entries.
+
 Quitting takes a capital ``Q`` in all b4 TUI apps (tracking list,
 review interface, Patchwork browser, and ``b4 bugs``). Bare ``q``
 only shows a reminder notification, so a stray keypress during
diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 0abf9b6..32eccad 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -5,23 +5,28 @@
 #
 __author__ = 'Konstantin Ryabitsev <konstantin@linuxfoundation.org>'
 
+import datetime
 import email.message
 import email.utils
 import io
 import json
 import re
+import threading
 from typing import Any, Dict, List, NamedTuple, Optional, Set, Tuple, Union
 
 from rich import box
+from rich.console import Console, ConsoleOptions, RenderResult
+from rich.markup import escape
 from rich.panel import Panel
 from rich.rule import Rule
 from rich.text import Text
 from textual.app import ComposeResult
 from textual.binding import Binding
-from textual.containers import Vertical
+from textual.containers import Horizontal, Vertical
 from textual.screen import ModalScreen
 from textual.suggester import SuggestFromList
 from textual.widgets import (
+    Button,
     Checkbox,
     Input,
     Label,
@@ -37,6 +42,7 @@ from textual.worker import Worker, WorkerState
 
 import b4
 import b4.review
+import b4.review.tracking
 import b4.tofu
 import b4.ty
 import liblore
@@ -227,6 +233,886 @@ class TrailerScreen(JKListNavMixin, ModalScreen[Optional[List[str]]]):
         self.dismiss(None)
 
 
+class _ClippedSeriesText:
+    def __init__(self, text: str) -> None:
+        self.text = text
+
+    def __rich_console__(
+        self, console: Console, options: ConsoleOptions
+    ) -> RenderResult:
+        text = Text(self.text, no_wrap=True, overflow='crop')
+        text.truncate(options.max_width, overflow='crop')
+        yield text
+
+
+class EditTrackedSeriesItem(ListItem):
+    """One selectable patch-series candidate in the add-series popup."""
+
+    def __init__(self, candidate: Dict[str, Any], selected: bool = False) -> None:
+        """Store the candidate and its initial selection state."""
+        super().__init__()
+        self.candidate = candidate
+        self.selected = selected
+        self.set_class(selected, 'selected-series')
+
+    def compose(self) -> ComposeResult:
+        """Display the candidate without interpreting its text as markup."""
+        yield Static(_ClippedSeriesText(self._label()), markup=False)
+
+    def _label(self) -> str:
+        """Format the selection marker and available series metadata."""
+        date = self.candidate.get('date')
+        date_text = date.strftime('%Y-%m-%d') if date else '----------'
+        subject = self.candidate.get('subject') or '(no subject)'
+        sender = (
+            self.candidate.get('fromname')
+            or self.candidate.get('fromemail')
+            or 'Unknown'
+        )
+        lsubject = b4.LoreSubject(subject)
+        extras = lsubject.get_extra_prefixes(exclude=['patch'])
+        count = self.candidate.get('num_patches') or 0
+        width = len(str(count)) if count else 1
+        prefix = ''.join(f'{extra},' for extra in extras)
+        mark = '●' if self.selected else '○'
+        return f'{mark} {sender[:20]:20}  {date_text}  [{prefix}v{self.candidate["revision"]},{0:0{width}d}/{count:0{width}d}] {lsubject.subject}'
+
+    def toggle(self) -> None:
+        """Toggle the selection marker in the displayed row."""
+        self.selected = not self.selected
+        self.set_class(self.selected, 'selected-series')
+        self.query_one(Static).update(_ClippedSeriesText(self._label()))
+
+
+class LoadMoreSeriesItem(ListItem):
+    """Request the next batch of Lore submissions."""
+
+    def compose(self) -> ComposeResult:
+        yield Static('Press Enter to load more Lore submissions')
+
+
+class AbandonTrackedSeriesConfirmScreen(ConfirmScreen):
+    """Confirm abandoning tracked series by keyboard or mouse."""
+
+    DEFAULT_CSS = """
+    #abandon-tracked-actions {
+        height: 3;
+        align-horizontal: right;
+        margin-top: 1;
+    }
+    """
+
+    def compose(self) -> ComposeResult:
+        with Vertical(id='confirm-dialog', classes='--border-warning') as dialog:
+            dialog.border_title = self._title
+            for line in self._body:
+                yield Static(line, markup=False)
+            with Horizontal(id='abandon-tracked-actions'):
+                yield Button('Confirm', id='abandon-tracked-confirm', variant='error')
+                yield Button('Cancel', id='abandon-tracked-cancel')
+
+    def on_button_pressed(self, event: Button.Pressed) -> None:
+        if event.button.id == 'abandon-tracked-confirm':
+            self.action_confirm()
+        elif event.button.id == 'abandon-tracked-cancel':
+            self.action_cancel()
+
+
+class EditTrackedSeriesScreen(ModalScreen[Optional[Dict[str, Any]]]):
+    """Browse recent Lore submissions and add selected series to tracking."""
+
+    BINDINGS = [
+        Binding('space', 'toggle_candidate', 'Select', show=False),
+        Binding('ctrl+y', 'track_selected', 'Track', show=False),
+        Binding('escape', 'cancel', 'Cancel'),
+        Binding('q', 'cancel', 'Cancel', show=False),
+    ]
+
+    DEFAULT_CSS = """
+    EditTrackedSeriesScreen {
+        align: center middle;
+    }
+    #add-series-dialog {
+        width: 90%;
+        height: 85%;
+        border: solid $accent;
+        background: $surface;
+        padding: 1 2;
+    }
+    #add-series-list {
+        height: 1fr;
+    }
+    #add-series-list > EditTrackedSeriesItem {
+        height: 1;
+    }
+    #add-series-list > EditTrackedSeriesItem > Static {
+        height: 1;
+    }
+    #add-series-list > EditTrackedSeriesItem.selected-series {
+        background: #173658;
+        color: $text;
+        text-style: bold;
+    }
+    #add-series-list:focus > EditTrackedSeriesItem.-highlight {
+        background: $block-cursor-background;
+        color: $block-cursor-foreground;
+        text-style: $block-cursor-text-style;
+    }
+    #add-series-hint {
+        height: 1;
+        color: $text-muted;
+    }
+    #add-series-actions {
+        height: 3;
+        align-horizontal: right;
+    }
+    #add-series-status {
+        height: 1;
+        color: $text-muted;
+    }
+    """
+
+    _RECENT_HOURS = 8
+
+    def __init__(
+        self, identifier: str, tracked_series: Optional[List[Dict[str, Any]]] = None
+    ) -> None:
+        """Initialize the project, candidate cache, and search state."""
+        super().__init__()
+        self._identifier = identifier
+        self._candidates: Dict[str, Dict[str, Any]] = {}
+        self._selected: Set[str] = set()
+        self._recent_ids: List[str] = []
+        self._recent_loaded = False
+        self._current_filter = ''
+        self._filter_generation = 0
+        self._search_generation = 0
+        self._is_tracking = False
+        self._tracking_cancelled = threading.Event()
+        self._search_end: Optional[datetime.datetime] = None
+        self._search_messages: Dict[str, email.message.EmailMessage] = {}
+        self._search_complete = False
+        self._searching = False
+        self._search_target = 0
+        self._browse_state: Optional[
+            Tuple[
+                Optional[datetime.datetime],
+                Dict[str, email.message.EmailMessage],
+                bool,
+                int,
+            ]
+        ] = None
+        for series in tracked_series or []:
+            message_id = series.get('message_id') or series['change_id']
+            candidate = dict(series)
+            try:
+                sent_at = datetime.datetime.fromisoformat(series.get('sent_at') or '')
+                if sent_at.tzinfo is None:
+                    sent_at = sent_at.replace(tzinfo=datetime.timezone.utc)
+            except (TypeError, ValueError):
+                sent_at = None
+            candidate.update(
+                message_id=message_id,
+                fromname=series.get('sender_name'),
+                fromemail=series.get('sender_email'),
+                date=sent_at,
+                tracked=True,
+            )
+            self._candidates[message_id] = candidate
+            self._selected.add(message_id)
+        self._recent_ids = list(self._candidates)
+        self._tracked_ids = set(self._candidates)
+
+    def compose(self) -> ComposeResult:
+        """Build the filter, candidate list, status, and tracking controls."""
+        with Vertical(id='add-series-dialog') as dialog:
+            dialog.border_title = 'Edit Tracked Series'
+            yield Input(
+                placeholder='Filter by subject or submitter name or email',
+                id='add-series-filter',
+            )
+            yield Static('Recent Lore submissions', id='add-series-list-name')
+            yield Static(
+                'Loading recent submissions…', id='add-series-status', markup=False
+            )
+            yield ListView(id='add-series-list')
+            yield Static('Space toggle  |  Ctrl-y apply', id='add-series-hint')
+            with Horizontal(id='add-series-actions'):
+                yield Button(
+                    'Apply changes',
+                    id='add-series-track',
+                    variant='primary',
+                    disabled=True,
+                )
+                yield Button('Cancel', id='add-series-cancel')
+
+    def on_mount(self) -> None:
+        """Focus the filter and begin loading recent submissions."""
+        self.query_one('#add-series-filter', Input).focus()
+        self._render_candidates('')
+        self._start_recent_search()
+
+    def _start_recent_search(self) -> None:
+        """Start browsing from the newest archive messages."""
+        self._start_search('', filter_text='')
+
+    def _visible_capacity(self) -> int:
+        """Return the number of single-line candidate rows visible at once."""
+        height = self.query_one('#add-series-list', ListView).size.height
+        return max(1, height)
+
+    @staticmethod
+    def _server_query(value: str) -> str:
+        """Build an escaped Lore subject-or-sender search expression."""
+        escaped = value.replace('\\', '\\\\').replace('"', '\\"')
+        return f'(s:"{escaped}" OR f:"{escaped}")'
+
+    @staticmethod
+    def _group_key(msg: email.message.EmailMessage) -> Optional[Tuple[str, ...]]:
+        """Identify a cover or first patch by change-id or message ID."""
+        lsubject = b4.LoreSubject(str(msg.get('Subject', '')))
+        if lsubject.reply or not lsubject.patch or lsubject.counter not in (0, 1):
+            return None
+
+        body, _charset = b4.LoreMessage.get_payload(msg)
+        match = re.search(r'^change-id:\s*(\S+)', body, flags=re.I | re.M)
+        if match:
+            return ('change-id', match.group(1).casefold())
+        msgid = b4.LoreMessage.get_clean_msgid(msg)
+        return ('message-id', msgid) if msgid else None
+
+    def _collect_candidates(
+        self, msgs: List[email.message.EmailMessage]
+    ) -> List[Dict[str, Any]]:
+        """Group messages into untracked series, newest first."""
+        groups: Dict[Tuple[str, ...], List[email.message.EmailMessage]] = {}
+        children: Dict[str, List[email.message.EmailMessage]] = {}
+        # Without a change-id, keep independent submissions separate unless
+        # threading, sender, subject, and increasing revision all agree.
+        fallback_msgs = {
+            key[1]: msg
+            for msg in msgs
+            if (key := self._group_key(msg)) is not None and key[0] == 'message-id'
+        }
+        revision_parents: Dict[str, str] = {}
+        for candidate_id, candidate_msg in fallback_msgs.items():
+            revision_subject = b4.LoreSubject(str(candidate_msg.get('Subject', '')))
+            sender = email.utils.parseaddr(str(candidate_msg.get('From', '')))[
+                1
+            ].casefold()
+            if not sender or not revision_subject.subject:
+                continue
+            references = b4.LoreMessage.clean_header(
+                str(candidate_msg.get('References', ''))
+            )
+            parents = [
+                b4.LoreMessage.get_clean_msgid(candidate_msg, header='In-Reply-To')
+                or ''
+            ]
+            parents.extend(ref.strip('<>') for ref in reversed(references.split()))
+            for parent_id in parents:
+                parent_msg = fallback_msgs.get(parent_id)
+                if parent_msg is None:
+                    continue
+                parent_subject = b4.LoreSubject(str(parent_msg.get('Subject', '')))
+                parent_sender = email.utils.parseaddr(str(parent_msg.get('From', '')))[
+                    1
+                ].casefold()
+                if (
+                    sender == parent_sender
+                    and revision_subject.subject.casefold()
+                    == parent_subject.subject.casefold()
+                    and revision_subject.revision > parent_subject.revision
+                ):
+                    revision_parents[candidate_id] = parent_id
+                    break
+        cover_revisions = {
+            msgid: cover_subject.revision
+            for msg in msgs
+            if (cover_subject := b4.LoreSubject(str(msg.get('Subject', '')))).counter
+            == 0
+            and cover_subject.patch
+            and not cover_subject.reply
+            and (msgid := b4.LoreMessage.get_clean_msgid(msg))
+        }
+        for msg in msgs:
+            lsubject = b4.LoreSubject(str(msg.get('Subject', '')))
+            parents = [b4.LoreMessage.get_clean_msgid(msg, header='In-Reply-To') or '']
+            references = b4.LoreMessage.clean_header(str(msg.get('References', '')))
+            parents.extend(ref.strip('<>') for ref in references.split())
+            if lsubject.patch and not lsubject.reply:
+                for parent in parents:
+                    if parent:
+                        children.setdefault(parent, []).append(msg)
+            if lsubject.counter == 1:
+                if any(
+                    cover_revisions.get(parent) == lsubject.revision
+                    for parent in parents
+                ):
+                    continue
+            key = self._group_key(msg)
+            if key is not None:
+                if key[0] == 'message-id':
+                    # Resolve v3 -> v2 -> v1 to one group even if mail arrived out of order.
+                    root = key[1]
+                    while root in revision_parents:
+                        root = revision_parents[root]
+                    key = ('message-id', root)
+                groups.setdefault(key, []).append(msg)
+
+        candidates: Dict[str, Dict[str, Any]] = {}
+        conn = b4.review.tracking.get_db(self._identifier)
+        try:
+            for group_msgs in groups.values():
+                mailbox = b4.LoreMailbox()
+                for msg in group_msgs:
+                    mailbox.add_message(msg)
+                if not mailbox.series and not mailbox.covers:
+                    continue
+                revision = max(set(mailbox.series) | set(mailbox.covers))
+                if revision in mailbox.series:
+                    lser = mailbox.get_series(
+                        revision, sloppytrailers=False, codereview_trailers=False
+                    )
+                    if not lser:
+                        continue
+                    message_id, _subject, _from_cover = (
+                        b4.review.tracking._raw_revision_ref(mailbox, revision)
+                    )
+                    subject = lser.subject
+                    fromname = lser.fromname
+                    fromemail = lser.fromemail
+                    num_patches = lser.expected
+                    change_id = lser.change_id
+                    ref_msg = mailbox.msgid_map.get(message_id)
+                else:
+                    cover = mailbox.covers[revision]
+                    message_id = cover.msgid
+                    subject = cover.subject
+                    fromname = cover.fromname
+                    fromemail = cover.fromemail
+                    num_patches = cover.expected
+                    change_id = ''
+                    ref_msg = cover
+                if not message_id or b4.review.tracking.find_tracked_change_id(
+                    conn, message_id
+                ):
+                    continue
+                searchable: List[str] = []
+                pending = [
+                    (msg, b4.LoreSubject(str(msg.get('Subject', ''))).revision)
+                    for msg in group_msgs
+                ]
+                seen: Set[Tuple[str, int]] = set()
+                while pending:
+                    msg, msg_revision = pending.pop()
+                    msgid = b4.LoreMessage.get_clean_msgid(msg)
+                    if not msgid or (msgid, msg_revision) in seen:
+                        continue
+                    seen.add((msgid, msg_revision))
+                    searchable.extend(
+                        b4.LoreMessage.clean_header(str(msg.get(field, '')))
+                        for field in ('Subject', 'From')
+                    )
+                    for child in children.get(msgid, []):
+                        child_subject = b4.LoreSubject(str(child.get('Subject', '')))
+                        if (
+                            child_subject.revision == msg_revision
+                            or child_subject.revision_inferred
+                        ):
+                            pending.append((child, msg_revision))
+                candidates[message_id] = {
+                    'message_id': message_id,
+                    'revision': revision,
+                    'subject': subject,
+                    'fromname': fromname,
+                    'fromemail': fromemail,
+                    'num_patches': num_patches,
+                    'change_id': change_id,
+                    'date': ref_msg.date if ref_msg else None,
+                    'search_text': ' '.join(searchable),
+                    'message_ids': {msgid for msgid, _ in seen},
+                }
+        finally:
+            conn.close()
+
+        return sorted(
+            candidates.values(),
+            key=lambda item: (
+                item['date']
+                or datetime.datetime.min.replace(tzinfo=datetime.timezone.utc)
+            ),
+            reverse=True,
+        )
+
+    def _start_search(
+        self, query: str, filter_text: str, recent: bool = False, more: bool = False
+    ) -> None:
+        """Launch a cancellable Lore search, delivering candidates by window."""
+        self._search_generation += 1
+        generation = self._search_generation
+        self.query_one('#add-series-status', Static).update(
+            Text(
+                'Loading recent submissions…'
+                if recent
+                else f'Searching Lore for {filter_text!r}…'
+            )
+        )
+
+        if not more:
+            self._search_end = None
+            self._search_messages = {}
+            self._search_complete = False
+            self._search_target = max(1, self._visible_capacity() // 2)
+        else:
+            self._search_target += max(1, self._visible_capacity() // 2)
+        capacity = self._search_target
+        self._searching = True
+
+        def _fetch() -> None:
+            """Fetch progressively older windows until the list is full or exhausted."""
+            try:
+                messages = dict(self._search_messages)
+                end = self._search_end or datetime.datetime.now(
+                    datetime.timezone.utc
+                ).replace(microsecond=0)
+                earliest = datetime.datetime(1970, 1, 1, tzinfo=datetime.timezone.utc)
+                interval = datetime.timedelta(hours=self._RECENT_HOURS)
+                while not worker_cancelled():
+                    start = None
+                    complete = end - earliest <= interval
+                    start = earliest if complete else end - interval
+                    lower = '' if complete else f'{start:%Y%m%d%H%M%S}'
+                    window_query = f'{query + " AND " if query else ""}dt:{lower}..{end:%Y%m%d%H%M%S}'
+                    with _quiet_worker():
+                        msgs = b4.get_pi_search_results(
+                            window_query,
+                            nocache=True,
+                            full_threads=bool(filter_text),
+                            raise_errors=True,
+                        )
+                        for msg in msgs or []:
+                            msgid = b4.LoreMessage.get_clean_msgid(msg)
+                            if msgid:
+                                messages[msgid] = msg
+                        candidates = self._collect_candidates(list(messages.values()))
+                    if worker_cancelled():
+                        return
+                    keep_searching = self.app.call_from_thread(
+                        self._finish_search,
+                        generation,
+                        filter_text,
+                        candidates,
+                        '',
+                        complete,
+                        capacity,
+                        start if not complete else None,
+                        messages,
+                    )
+                    if not keep_searching:
+                        return
+                    end = start - datetime.timedelta(seconds=1)
+                    interval *= 2
+            except liblore.OperationCancelledError:
+                return
+            except Exception as ex:
+                if not worker_cancelled():
+                    self.app.call_from_thread(
+                        self._finish_search,
+                        generation,
+                        filter_text,
+                        [],
+                        str(ex),
+                        True,
+                        capacity,
+                        None,
+                        {},
+                    )
+
+        run_lore_worker(
+            self,
+            _fetch,
+            name=f'add-series-search-{generation}',
+            group='add-series-search',
+            exclusive=True,
+        )
+
+    def _finish_search(
+        self,
+        generation: int,
+        filter_text: str,
+        candidates: List[Dict[str, Any]],
+        error: str,
+        complete: bool,
+        capacity: int,
+        since: Optional[datetime.datetime],
+        messages: Dict[str, email.message.EmailMessage],
+    ) -> bool:
+        """Render a current search batch and say whether to fetch another."""
+        if generation != self._search_generation:
+            return False
+        if error:
+            self._searching = False
+            self.query_one('#add-series-status', Static).update(
+                Text(f'Lore search failed: {error}')
+            )
+            return False
+        aliases = {
+            msgid: candidate['message_id']
+            for candidate in self._candidates.values()
+            for msgid in candidate.get('message_ids', set())
+            if msgid not in self._candidates
+        }
+        normalized: Dict[str, Dict[str, Any]] = {}
+        for candidate in candidates:
+            msgid = candidate['message_id']
+            cached = self._candidates.get(aliases.get(msgid, msgid))
+            if cached is not None:
+                merged = dict(
+                    cached if msgid in aliases or cached.get('tracked') else candidate
+                )
+                merged['message_ids'] = cached.get(
+                    'message_ids', set()
+                ) | candidate.get('message_ids', set())
+                merged['search_text'] = ' '.join(
+                    (cached.get('search_text', ''), candidate.get('search_text', ''))
+                )
+                candidate = merged
+            if since is None or candidate['date'] is None or candidate['date'] >= since:
+                normalized[candidate['message_id']] = candidate
+        candidates = list(normalized.values())
+        incoming_ids = set(normalized)
+        replacements = {
+            msgid: candidate['message_id']
+            for candidate in candidates
+            for msgid in candidate.get('message_ids', set())
+            if msgid in self._candidates and msgid not in incoming_ids
+        }
+        if replacements:
+            self._selected = {
+                replacements.get(msgid, msgid) for msgid in self._selected
+            }
+            self._recent_ids = list(
+                dict.fromkeys(
+                    replacements.get(msgid, msgid) for msgid in self._recent_ids
+                )
+            )
+            for msgid in replacements:
+                del self._candidates[msgid]
+        self._candidates.update(
+            {candidate['message_id']: candidate for candidate in candidates}
+        )
+        tracked = [item for item in self._candidates.values() if item.get('tracked')]
+        if not filter_text:
+            self._recent_ids = [candidate['message_id'] for candidate in candidates]
+            self._recent_loaded = True
+        matches = self._filtered_candidates(filter_text, candidates)
+        keep_searching = not complete and len(matches) < capacity
+        self._search_messages = dict(messages)
+        self._search_end = since - datetime.timedelta(seconds=1) if since else None
+        self._search_complete = complete
+        self._searching = keep_searching
+        self._render_candidates(
+            filter_text, tracked + candidates, searching=keep_searching
+        )
+        return keep_searching
+
+    def _filtered_candidates(
+        self, value: str, candidates: Optional[List[Dict[str, Any]]] = None
+    ) -> List[Dict[str, Any]]:
+        """Match cached or supplied candidates against subject and sender fields."""
+        needle = value.casefold().strip()
+        if candidates is None:
+            candidates = list(self._candidates.values())
+        if needle:
+            candidates = [
+                candidate
+                for candidate in candidates
+                if needle
+                in ' '.join(
+                    str(candidate.get(field, ''))
+                    for field in ('subject', 'fromname', 'fromemail', 'search_text')
+                ).casefold()
+            ]
+        return candidates
+
+    def _render_candidates(
+        self,
+        value: str,
+        candidates: Optional[List[Dict[str, Any]]] = None,
+        searching: bool = False,
+    ) -> None:
+        """Replace visible rows while preserving selection and the highlighted item."""
+        lv = self.query_one('#add-series-list', ListView)
+        candidates = self._filtered_candidates(value, candidates)
+        candidates.sort(
+            key=lambda candidate: (
+                candidate.get('date')
+                or datetime.datetime.min.replace(tzinfo=datetime.timezone.utc)
+            ).timestamp(),
+            reverse=True,
+        )
+        highlighted = lv.highlighted_child
+        highlighted_id = (
+            highlighted.candidate['message_id']
+            if isinstance(highlighted, EditTrackedSeriesItem)
+            else None
+        )
+        lv.clear()
+        lore_indices = [
+            index
+            for index, candidate in enumerate(candidates)
+            if not candidate.get('tracked')
+        ]
+        load_more_at = lore_indices[-1] + 1 if lore_indices else len(candidates)
+        for index, candidate in enumerate(candidates):
+            if (
+                index == load_more_at
+                and not self._searching
+                and not self._search_complete
+            ):
+                lv.append(LoadMoreSeriesItem())
+            lv.append(
+                EditTrackedSeriesItem(
+                    candidate, selected=candidate['message_id'] in self._selected
+                )
+            )
+        if (
+            load_more_at == len(candidates)
+            and not self._searching
+            and not self._search_complete
+        ):
+            lv.append(LoadMoreSeriesItem())
+        for index, candidate in enumerate(candidates):
+            if candidate['message_id'] == highlighted_id:
+                lv.index = index + int(
+                    index >= load_more_at
+                    and not self._searching
+                    and not self._search_complete
+                )
+                break
+        suffix = ' (searching Lore...)' if searching else ''
+        self.query_one('#add-series-status', Static).update(
+            f'{len(candidates)} matching series{suffix}'
+        )
+        self._update_track_button()
+
+    def on_input_changed(self, event: Input.Changed) -> None:
+        """Filter cached rows immediately and debounce a new Lore search."""
+        if event.input.id != 'add-series-filter':
+            return
+        value = event.value.strip()
+        if value == self._current_filter:
+            return
+        previous_filter = self._current_filter
+        self._current_filter = value
+        self._filter_generation += 1
+        generation = self._filter_generation
+        self._search_generation += 1
+        self.app.workers.cancel_group(self, 'add-series-search')
+        self._searching = False
+        if value:
+            if not previous_filter:
+                self._browse_state = (
+                    self._search_end,
+                    dict(self._search_messages),
+                    self._search_complete,
+                    self._search_target,
+                )
+            self._render_candidates(value)
+            self.set_timer(0.35, lambda: self._search_filter(value, generation))
+        else:
+            recent = [
+                self._candidates[mid]
+                for mid in self._tracked_ids | set(self._recent_ids)
+                if mid in self._candidates
+            ]
+            if self._browse_state is not None:
+                (
+                    self._search_end,
+                    self._search_messages,
+                    self._search_complete,
+                    self._search_target,
+                ) = self._browse_state
+            self._render_candidates(value, recent)
+            if not self._recent_loaded:
+                self._start_recent_search()
+
+    def _search_filter(self, value: str, generation: int) -> None:
+        """Start a debounced search only if the filter has not changed again."""
+        if generation != self._filter_generation:
+            return
+        self._start_search(self._server_query(value), value)
+
+    def on_input_submitted(self, event: Input.Submitted) -> None:
+        """Move focus from the filter to the candidate list."""
+        if event.input.id == 'add-series-filter':
+            self.query_one('#add-series-list', ListView).focus()
+
+    def on_list_view_selected(self, event: ListView.Selected) -> None:
+        """Toggle a candidate selected with Enter."""
+        if event.list_view.id != 'add-series-list':
+            return
+        event.stop()
+        if isinstance(event.item, LoadMoreSeriesItem):
+            value = self.query_one('#add-series-filter', Input).value.strip()
+            self._start_search(
+                self._server_query(value) if value else '', value, more=True
+            )
+            return
+        self._toggle_candidate(event.item)
+
+    def action_toggle_candidate(self) -> None:
+        """Toggle the highlighted candidate with Space."""
+        lv = self.query_one('#add-series-list', ListView)
+        item = lv.highlighted_child
+        if isinstance(item, EditTrackedSeriesItem) and not self._is_tracking:
+            self._toggle_candidate(item)
+            lv.action_cursor_down()
+
+    def _toggle_candidate(self, item: Any) -> None:
+        """Update the selected message IDs and the corresponding row."""
+        if self._is_tracking or not isinstance(item, EditTrackedSeriesItem):
+            return
+        message_id = item.candidate['message_id']
+        if message_id in self._selected:
+            self._selected.remove(message_id)
+        else:
+            self._selected.add(message_id)
+        item.toggle()
+        self._update_track_button()
+
+    def _update_track_button(self) -> None:
+        """Show the selection count and enable tracking when appropriate."""
+        button = self.query_one('#add-series-track', Button)
+        changed = self._selected != self._tracked_ids
+        button.label = 'Apply changes'
+        button.disabled = not changed or self._is_tracking
+
+    def on_button_pressed(self, event: Button.Pressed) -> None:
+        """Handle the popup's track and cancel buttons."""
+        if event.button.id == 'add-series-cancel':
+            self.action_cancel()
+        elif event.button.id == 'add-series-track':
+            self.action_track_selected()
+
+    def action_track_selected(self) -> None:
+        """Stop searching and track selected candidates in a background worker."""
+        if self._is_tracking or self._selected == self._tracked_ids:
+            return
+        removed = [self._candidates[mid] for mid in self._tracked_ids - self._selected]
+        if removed:
+            self.app.push_screen(
+                AbandonTrackedSeriesConfirmScreen(
+                    title='Abandon tracked series?',
+                    body=[
+                        f'Abandon {len(removed)} tracked series and delete their review branches?',
+                        'Tracking data for all revisions will be removed.',
+                    ],
+                    border='$warning',
+                ),
+                callback=lambda confirmed: (
+                    self._apply_selection(removed) if confirmed else None
+                ),
+            )
+            return
+        self._apply_selection([])
+
+    def _apply_selection(self, removed: List[Dict[str, Any]]) -> None:
+        self._filter_generation += 1
+        self._search_generation += 1
+        self.app.workers.cancel_group(self, 'add-series-search')
+        selected = [self._candidates[mid] for mid in self._selected - self._tracked_ids]
+        self._is_tracking = True
+        self._tracking_cancelled.clear()
+        self.query_one('#add-series-filter', Input).disabled = True
+        self.query_one('#add-series-list', ListView).disabled = True
+        self._update_track_button()
+        self.query_one('#add-series-status', Static).update(
+            f'Tracking {len(selected)} selected series…'
+        )
+
+        def _track() -> None:
+            """Track each selected candidate and collect outcomes for the UI."""
+            result: Dict[str, Any] = {
+                'tracked': 0,
+                'updated': 0,
+                'already_tracked': 0,
+                'errors': [],
+                'removed': removed,
+                'selected_change_ids': [],
+            }
+            for candidate in selected:
+                if worker_cancelled() or self._tracking_cancelled.is_set():
+                    break
+                try:
+                    with _quiet_worker():
+                        outcome = b4.review.tracking.track_series_from_msgid(
+                            self._identifier,
+                            candidate['message_id'],
+                            b4.git_get_toplevel(),
+                        )
+                    if outcome.get('change_id'):
+                        result['selected_change_ids'].append(outcome['change_id'])
+                    if outcome['status'] == 'already-tracked':
+                        result['already_tracked'] += 1
+                    else:
+                        result[outcome['status']] += 1
+                except liblore.OperationCancelledError:
+                    break
+                except Exception as ex:
+                    result['errors'].append(f'{candidate["subject"]}: {ex}')
+            if self._tracking_cancelled.is_set() or result['errors']:
+                result['removed'] = []
+            else:
+                result['removed'] = [
+                    series
+                    for series in removed
+                    if series.get('change_id') not in result['selected_change_ids']
+                ]
+            if worker_cancelled():
+                return
+            self.app.call_from_thread(self._finish_tracking, result)
+
+        run_lore_worker(self, _track, name='add-series-track', exclusive=True)
+
+    def _finish_tracking(self, result: Dict[str, Any]) -> None:
+        """Return successful results or show why no series were tracked."""
+        self._is_tracking = False
+        if result['tracked'] or result['updated'] or result.get('removed'):
+            self.dismiss(result)
+            return
+        if self._tracking_cancelled.is_set():
+            self.dismiss(
+                result if result['errors'] or result['already_tracked'] else None
+            )
+            return
+        errors = result['errors']
+        if errors:
+            detail = errors[0]
+            for error in errors:
+                b4.logger.warning('Tracking error: %s', error)
+                self.app.notify(escape(error), severity='error', timeout=10)
+        elif result['already_tracked']:
+            detail = f'{result["already_tracked"]} selected series already tracked'
+        else:
+            detail = 'No new series were tracked'
+        self.query_one('#add-series-filter', Input).disabled = False
+        self.query_one('#add-series-list', ListView).disabled = False
+        self.query_one('#add-series-status', Static).update(Text(detail))
+        self._update_track_button()
+
+    def action_cancel(self) -> None:
+        """Cancel an active batch or close the popup when tracking is idle."""
+        if not self._is_tracking:
+            self.dismiss(None)
+        elif not self._tracking_cancelled.is_set():
+            self._tracking_cancelled.set()
+            self.query_one('#add-series-cancel', Button).disabled = True
+            self.query_one('#add-series-status', Static).update('Cancelling tracking…')
+            b4.get_lore_node().cancel_active()
+
+
 class HelpScreen(ModalScreen[None]):
     """Parametric modal showing keybinding help.
 
@@ -378,6 +1264,7 @@ TRACKING_HELP_LINES = [
     '  [bold]e[/bold]         View email thread\n',
     '  [bold]d[/bold]         Range-diff between revisions\n',
     '  [bold]a[/bold]         Open action menu (take, rebase, etc.)\n',
+    '  [bold]E[/bold]         Edit tracked series and browse Lore\n',
     '  [bold]u[/bold]         Update selected series\n',
     '\n',
     '[bold]App[/bold]\n',
diff --git a/src/b4/review_tui/_tracking_app.py b/src/b4/review_tui/_tracking_app.py
index 714f215..d2621c0 100644
--- a/src/b4/review_tui/_tracking_app.py
+++ b/src/b4/review_tui/_tracking_app.py
@@ -35,6 +35,7 @@ from typing import (
     Union,
 )
 
+from rich.markup import escape
 from rich.text import Text as RichText
 from textual.app import App, ComposeResult
 from textual.binding import Binding
@@ -83,6 +84,7 @@ from b4.review_tui._modals import (
     BaseSelectionScreen,
     CheckLoadingScreen,
     CherryPickScreen,
+    EditTrackedSeriesScreen,
     HelpScreen,
     KeyDecisionScreen,
     LimitScreen,
@@ -1110,6 +1112,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         'action': 'Series',
         'update_one': 'Series',
         'target_branch': 'Series',
+        'edit_tracked_series': 'App',
         'update_all': 'App',
         'process_queue': 'App',
         'limit': 'App',
@@ -1133,6 +1136,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
         Binding('u', 'update_one', 'update'),
         Binding('d', 'range_diff', 'range-diff'),
         # App-global actions
+        Binding('E', 'edit_tracked_series', 'edit tracked', key_display='E'),
         Binding('l', 'limit', 'limit'),
         Binding('s', 'suspend', 'shell'),
         Binding('p', 'patchwork', 'patchwork'),
@@ -1514,7 +1518,7 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
 
             if not display_series:
                 empty = Static(
-                    'No tracked series. Use "b4 review track" to add series.',
+                    'No tracked series. Use "b4 review track" or press E to edit.',
                     id='tracking-empty',
                 )
                 await self.mount(empty, before=footer)
@@ -1571,6 +1575,48 @@ class TrackingApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[Optional[str]]):
             callback=self._on_limit,
         )
 
+    def action_edit_tracked_series(self) -> None:
+        """Open the Lore submission browser for this project."""
+        self.push_screen(
+            EditTrackedSeriesScreen(self._identifier, self._all_series),
+            callback=self._on_add_series,
+        )
+
+    def _on_add_series(self, result: Optional[Dict[str, Any]]) -> None:
+        """Refresh tracked series and report the popup's tracking outcomes."""
+        if not result:
+            return
+        for series in result.get('removed', []):
+            change_id = series['change_id']
+            review_branch = f'b4/review/{change_id}'
+            self._on_abandon_confirmed(
+                True,
+                change_id,
+                review_branch,
+                b4.git_branch_exists(None, review_branch),
+                revision=series.get('revision'),
+            )
+        if result.get('tracked') or result.get('updated'):
+            self._invalidate_caches()
+            self._load_series()
+        parts = []
+        if result.get('tracked'):
+            parts.append(f'{result["tracked"]} tracked')
+        if result.get('updated'):
+            parts.append(f'{result["updated"]} updated')
+        if result.get('already_tracked'):
+            parts.append(f'{result["already_tracked"]} already tracked')
+        if result.get('errors'):
+            parts.append(f'{len(result["errors"])} failed')
+        if parts:
+            severity: Literal['warning', 'information'] = (
+                'warning' if result.get('errors') else 'information'
+            )
+            self.notify('; '.join(parts), severity=severity)
+        for error in result.get('errors', []):
+            logger.warning('Tracking error: %s', error)
+            self.notify(escape(error), severity='error', timeout=10)
+
     def _on_limit(self, result: Optional[str]) -> None:
         if result is None:
             return
diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index 5e654b9..5bf5cf6 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -1646,6 +1646,7 @@ class TestLoreFetchMessages:
 
     @pytest.mark.parametrize('status_code', [None, 503, 404])
     def test_search_can_propagate_failures(self, node: Any, status_code: Any) -> None:
+        """Propagate search failures on request while treating 404 as no results."""
         import liblore
 
         node.get_mbox_by_query.side_effect = liblore.RemoteError(
diff --git a/src/tests/test_tui_tracking.py b/src/tests/test_tui_tracking.py
index 88a8663..755a510 100644
--- a/src/tests/test_tui_tracking.py
+++ b/src/tests/test_tui_tracking.py
@@ -12,10 +12,14 @@ status transitions, and modal interactions.
 """
 
 import contextlib
+import datetime
 import email.message
+import email.utils
 import os
 import pathlib
+import re
 import sqlite3
+import threading
 from types import SimpleNamespace
 from typing import Any, Callable, Dict, Generator, List, Optional, Tuple
 from unittest.mock import MagicMock, Mock, patch
@@ -26,13 +30,14 @@ pytest.importorskip('textual')
 
 from textual.app import App
 from textual.containers import Vertical
-from textual.widgets import Footer, Input, ListView, Static
+from textual.widgets import Button, Footer, Input, ListView, Static
 
 import b4
 import b4.review
 import b4.review.tracking as tracking
 import b4.review_tui._entry as _entry
 import b4.review_tui._tracking_app as _tracking_app
+import liblore
 from b4 import (
     _abort_worktree_op,
     _worktree_has_unmerged,
@@ -46,6 +51,8 @@ from b4.review_tui._modals import (
     BaseSelectionScreen,
     CherryPickScreen,
     ConfirmScreen,
+    EditTrackedSeriesItem,
+    EditTrackedSeriesScreen,
     HelpScreen,
     LimitScreen,
     LinkRevisionScreen,
@@ -67,6 +74,7 @@ from b4.review_tui._tracking_app import (
     _worktree_for_branch,
 )
 
+from .helpers.mail import MINIMAL_DIFF, make_msg
 from .helpers.tracking import create_review_branch, seed_db, tag
 from .helpers.tui import static_text
 
@@ -134,6 +142,1263 @@ def _get_action_keys(app: TrackingApp) -> List[str]:
 class TestTrackingAppStartup:
     """Tests for the TrackingApp startup and series listing."""
 
+    @pytest.mark.asyncio
+    async def test_editor_row_clips_subject_mid_word(self) -> None:
+        """A one-line row uses the available width instead of wrapping a word."""
+        candidate = {
+            'message_id': 'clip@example.com',
+            'revision': 1,
+            'subject': '[PATCH] short extraordinarilylongsubject',
+            'fromname': 'Author',
+            'num_patches': 1,
+            'date': None,
+        }
+        item = EditTrackedSeriesItem(candidate)
+        app: App[None] = App()
+        async with app.run_test(size=(60, 10)) as pilot:
+            await app.mount(item)
+            await pilot.pause()
+            label = item.query_one(Static)
+            label.styles.width = 52
+            await pilot.pause()
+            before = label.render_line(0).text
+            assert 'short e' in before
+            item.toggle()
+            await pilot.pause()
+            assert 'short e' in label.render_line(0).text
+
+    @pytest.mark.asyncio
+    async def test_e_opens_editor_with_tracked_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The edit popup opens with the same series shown in the tracking list."""
+        seed_db('test-edit-prefill', SAMPLE_SERIES)
+        app = TrackingApp('test-edit-prefill')
+
+        with patch('b4.get_pi_search_results', return_value=[]):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                assert isinstance(app.screen, EditTrackedSeriesScreen)
+                assert {
+                    item.candidate['change_id']
+                    for item in app.screen.query(EditTrackedSeriesItem)
+                    if item.selected
+                } == {series['change_id'] for series in app._all_series}
+
+    @pytest.mark.asyncio
+    async def test_editor_filters_tracked_series_case_insensitively(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Filtering applies to tracked rows regardless of letter case."""
+        seed_db('test-edit-filter', SAMPLE_SERIES)
+        app = TrackingApp('test-edit-filter')
+        with patch('b4.get_pi_search_results', return_value=[]):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                screen.query_one('#add-series-filter', Input).value = 'ALICE'
+                await pilot.pause(0.6)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert [
+                    item.candidate['change_id']
+                    for item in screen.query(EditTrackedSeriesItem)
+                ] == ['test-change-alpha']
+
+    @pytest.mark.asyncio
+    async def test_editor_space_toggles_and_advances(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Space toggles each series and advances the cursor one row."""
+        seed_db('test-edit-space', SAMPLE_SERIES[:2])
+        app = TrackingApp('test-edit-space')
+        with patch('b4.get_pi_search_results', return_value=[]):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                lv = app.screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                first = lv.highlighted_child
+                assert isinstance(first, EditTrackedSeriesItem)
+                assert first.selected is True
+                await pilot.press('space')
+                await pilot.pause()
+                assert getattr(first, 'selected') is False
+                assert lv.index == 1
+                second = lv.highlighted_child
+                assert isinstance(second, EditTrackedSeriesItem)
+                assert second.selected is True
+                await pilot.press('space')
+                await pilot.pause()
+                assert getattr(second, 'selected') is False
+
+    @pytest.mark.asyncio
+    async def test_editor_confirms_before_abandoning_tracked_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A deselected series is removed only after explicit confirmation."""
+        seed_db('test-edit-abandon', SAMPLE_SERIES[:1])
+        app = TrackingApp('test-edit-abandon')
+        with patch('b4.get_pi_search_results', return_value=[]):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                lv = screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.click('#add-series-track')
+                await pilot.pause()
+                assert isinstance(app.screen, ConfirmScreen)
+                assert tracking.get_all_tracked_series('test-edit-abandon')
+                await pilot.press('y')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert not tracking.get_all_tracked_series('test-edit-abandon')
+
+    @pytest.mark.asyncio
+    async def test_editor_abandon_confirmation_mouse_buttons(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Mouse cancellation preserves tracking; confirmation abandons it."""
+        identifier = 'test-edit-abandon-mouse'
+        seed_db(identifier, SAMPLE_SERIES[:1])
+        app = TrackingApp(identifier)
+        with patch('b4.get_pi_search_results', return_value=[]):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                lv = screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.click('#add-series-track')
+                await pilot.pause()
+                await pilot.click('#abandon-tracked-cancel')
+                await pilot.pause()
+                assert app.screen is screen
+                assert tracking.get_all_tracked_series(identifier)
+                await pilot.click('#add-series-track')
+                await pilot.pause()
+                await pilot.click('#abandon-tracked-confirm')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert not tracking.get_all_tracked_series(identifier)
+
+    @pytest.mark.asyncio
+    async def test_editor_keeps_series_when_new_revision_is_selected(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Selecting another revision must not abandon its tracked series."""
+        identifier = 'test-edit-same-change'
+        now = datetime.datetime.now(datetime.timezone.utc)
+        series = dict(
+            SAMPLE_SERIES[0], sent_at=(now - datetime.timedelta(hours=2)).isoformat()
+        )
+        seed_db(identifier, [series])
+        app = TrackingApp(identifier)
+        msg = make_msg(
+            'new-revision@example.com',
+            '[PATCH v2] new revision',
+            body=MINIMAL_DIFF,
+            date=email.utils.format_datetime(now),
+        )
+        with (
+            patch('b4.get_pi_search_results', return_value=[msg]),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=2),
+            patch(
+                'b4.review.tracking.track_series_from_msgid',
+                return_value={'status': 'updated', 'change_id': 'test-change-alpha'},
+            ),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                lv = screen.query_one('#add-series-list', ListView)
+                items = [
+                    item
+                    for item in lv.children
+                    if isinstance(item, EditTrackedSeriesItem)
+                ]
+                for item in items:
+                    if (
+                        item.selected
+                        or item.candidate['message_id'] == 'new-revision@example.com'
+                    ):
+                        screen._toggle_candidate(item)
+                await pilot.click('#add-series-track')
+                await pilot.pause()
+                assert isinstance(app.screen, ConfirmScreen)
+                await pilot.press('y')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert tracking.get_all_tracked_series(identifier)
+
+    @pytest.mark.asyncio
+    async def test_editor_loads_more_lore_on_enter(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The load-more row resumes archive browsing after the first batch."""
+        seed_db('test-edit-more', [])
+        app = TrackingApp('test-edit-more')
+        now = datetime.datetime.now(datetime.timezone.utc)
+        messages = [
+            make_msg(
+                'first@example.com',
+                '[PATCH] first',
+                body=MINIMAL_DIFF,
+                date=email.utils.format_datetime(now - datetime.timedelta(hours=1)),
+            ),
+            make_msg(
+                'second@example.com',
+                '[PATCH] second',
+                body=MINIMAL_DIFF,
+                date=email.utils.format_datetime(now - datetime.timedelta(hours=9)),
+            ),
+        ]
+        with (
+            patch(
+                'b4.get_pi_search_results', side_effect=[[messages[0]], [messages[1]]]
+            ) as search,
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=2),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                lv = screen.query_one('#add-series-list', ListView)
+                assert len(list(screen.query(EditTrackedSeriesItem))) == 1
+                lv.focus()
+                lv.index = 1
+                await pilot.press('enter')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert len(list(screen.query(EditTrackedSeriesItem))) == 2
+                assert search.call_count == 2
+
+    @pytest.mark.asyncio
+    async def test_editor_orders_tracked_and_lore_by_date(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Interleave results and place load-more after the oldest Lore row."""
+        now = datetime.datetime.now(datetime.timezone.utc)
+        tracked = [
+            dict(
+                SAMPLE_SERIES[0], sent_at=(now - datetime.timedelta(days=3)).isoformat()
+            )
+        ]
+        seed_db('test-edit-order', tracked)
+        app = TrackingApp('test-edit-order')
+        msg = make_msg(
+            'lore@example.com',
+            '[PATCH] newer',
+            body=MINIMAL_DIFF,
+            date=email.utils.format_datetime(now - datetime.timedelta(hours=1)),
+        )
+        with (
+            patch('b4.get_pi_search_results', return_value=[msg]),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=2),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                rows = list(app.screen.query_one('#add-series-list', ListView).children)
+                assert isinstance(rows[0], EditTrackedSeriesItem)
+                assert rows[0].candidate['message_id'] == 'lore@example.com'
+                assert rows[1].__class__.__name__ == 'LoadMoreSeriesItem'
+                assert isinstance(rows[2], EditTrackedSeriesItem)
+                assert rows[2].candidate['change_id'] == 'test-change-alpha'
+
+    @pytest.mark.asyncio
+    async def test_capital_a_opens_add_series_popup(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Capital A opens the add-series popup from the tracking list."""
+        seed_db('test-add-series', [])
+        app = TrackingApp('test-add-series')
+
+        with patch('b4.get_pi_search_results', return_value=[]):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                original_screen = app.screen
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+
+                assert app.screen is not original_screen
+                assert app.screen.query_one('#add-series-filter', Input)
+
+    @pytest.mark.asyncio
+    async def test_add_series_heading_does_not_claim_outgoing_recipient(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """The archive heading does not mistake send recipients for the archive."""
+        seed_db('test-add-heading', [])
+        app = TrackingApp('test-add-heading')
+        with (
+            patch.dict(b4.get_main_config(), {'send-series-to': 'other@example.com'}),
+            patch('b4.get_pi_search_results', return_value=[]),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                heading = static_text(
+                    app.screen.query_one('#add-series-list-name', Static)
+                )
+                assert heading == 'Recent Lore submissions'
+
+    def test_candidate_search_groups_series_at_the_cover_or_first_patch(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Represent covered and uncovered series by their cover or first patch."""
+        identifier = 'test-add-grouping'
+        seed_db(identifier, [])
+        screen = EditTrackedSeriesScreen(identifier)
+        messages = [
+            make_msg(
+                'cover@example.com',
+                '[PATCH 0/2] Covered series',
+                body='Series cover.\n',
+            ),
+            make_msg(
+                'covered-patch1@example.com',
+                '[PATCH 1/2] Covered series: first patch',
+                body=MINIMAL_DIFF,
+                in_reply_to='cover@example.com',
+            ),
+            make_msg(
+                'covered-patch2@example.com',
+                '[PATCH 2/2] Covered series: second patch',
+                body=MINIMAL_DIFF,
+                in_reply_to='cover@example.com',
+            ),
+            make_msg(
+                'uncovered-patch1@example.com',
+                '[PATCH 1/2] Uncovered series: first patch',
+                body=MINIMAL_DIFF,
+            ),
+            make_msg(
+                'uncovered-patch2@example.com',
+                '[PATCH 2/2] Uncovered series: second patch',
+                body=MINIMAL_DIFF,
+            ),
+        ]
+
+        candidates = screen._collect_candidates(messages)
+
+        assert {candidate['message_id'] for candidate in candidates} == {
+            'cover@example.com',
+            'uncovered-patch1@example.com',
+        }
+
+    def test_candidate_search_keeps_independent_same_subject_submissions(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Same-author submissions with identical subjects remain selectable."""
+        identifier = 'test-add-same-subject'
+        seed_db(identifier, [])
+        screen = EditTrackedSeriesScreen(identifier)
+        messages = [
+            make_msg('first@example.com', '[PATCH 1/2] Fix typo', body=MINIMAL_DIFF),
+            make_msg('second@example.com', '[PATCH 1/2] Fix typo', body=MINIMAL_DIFF),
+        ]
+
+        candidates = screen._collect_candidates(messages)
+
+        assert {candidate['message_id'] for candidate in candidates} == {
+            'first@example.com',
+            'second@example.com',
+        }
+
+    @pytest.mark.parametrize(
+        'subject,sender,reply,expected',
+        [
+            ('[PATCH v2 0/2] Feature', 'Test Author <test@example.com>', True, True),
+            ('[PATCH v2 0/2] Different', 'Test Author <test@example.com>', True, False),
+            ('[PATCH v2 0/2] Feature', 'Other <other@example.com>', True, False),
+            ('[PATCH v2 0/2] Feature', None, True, False),
+            ('[PATCH v2 0/2] Feature', 'Test Author <test@example.com>', False, False),
+            ('[PATCH 0/2] Feature', 'Test Author <test@example.com>', True, False),
+        ],
+    )
+    def test_candidate_search_groups_only_evidenced_revisions(
+        self,
+        tmp_path: pathlib.Path,
+        subject: str,
+        sender: Optional[str],
+        reply: bool,
+        expected: bool,
+    ) -> None:
+        """Group threaded revisions only when sender, subject and version agree."""
+        identifier = 'test-add-threaded-revisions'
+        seed_db(identifier, [])
+        screen = EditTrackedSeriesScreen(identifier)
+        messages = [
+            make_msg('v1@example.com', '[PATCH 0/2] Feature'),
+            make_msg(
+                'v2@example.com',
+                subject,
+                from_addr=sender,
+                in_reply_to='v1@example.com' if reply else None,
+            ),
+        ]
+
+        expected_ids = {'v2@example.com'}
+        if not expected:
+            expected_ids.add('v1@example.com')
+        assert {
+            item['message_id'] for item in screen._collect_candidates(messages)
+        } == expected_ids
+
+    def test_candidate_search_groups_out_of_order_revision_chain(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Threaded revisions group regardless of the order messages arrive."""
+        identifier = 'test-add-revision-chain'
+        seed_db(identifier, [])
+        screen = EditTrackedSeriesScreen(identifier)
+        messages = [
+            make_msg(
+                'v3@example.com', '[PATCH v3 0/2] Feature', in_reply_to='v2@example.com'
+            ),
+            make_msg('v1@example.com', '[PATCH 0/2] Feature'),
+            make_msg(
+                'v2@example.com', '[PATCH v2 0/2] Feature', in_reply_to='v1@example.com'
+            ),
+        ]
+
+        candidates = screen._collect_candidates(messages)
+
+        assert [item['message_id'] for item in candidates] == ['v3@example.com']
+        assert candidates[0]['message_ids'] == {
+            'v1@example.com',
+            'v2@example.com',
+            'v3@example.com',
+        }
+
+    def test_candidate_search_keeps_new_revision_reply_to_older_cover(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A first patch replying to an older cover is still a candidate."""
+        identifier = 'test-add-revision-reply'
+        seed_db(identifier, [])
+        screen = EditTrackedSeriesScreen(identifier)
+        messages = [
+            make_msg('cover-v1@example.com', '[PATCH 0/2] Feature'),
+            make_msg(
+                'patch-v2@example.com',
+                '[PATCH v2 1/2] New version only',
+                body=MINIMAL_DIFF,
+                in_reply_to='cover-v1@example.com',
+            ),
+        ]
+
+        candidates = screen._collect_candidates(messages)
+
+        assert 'patch-v2@example.com' in {
+            candidate['message_id'] for candidate in candidates
+        }
+        assert [
+            candidate['message_id']
+            for candidate in screen._filtered_candidates('version only', candidates)
+        ] == ['patch-v2@example.com']
+
+    def test_candidate_search_prefers_newer_cover_without_its_first_patch(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A newer cover wins over an older patch for the same change-id."""
+        identifier = 'test-add-newer-cover'
+        seed_db(identifier, [])
+        screen = EditTrackedSeriesScreen(identifier)
+        messages = [
+            make_msg(
+                'patch-v1@example.com',
+                '[PATCH] Feature',
+                body=MINIMAL_DIFF + '\nchange-id: shared-feature\n',
+            ),
+            make_msg(
+                'cover-v2@example.com',
+                '[PATCH v2 0/2] Feature',
+                body='change-id: shared-feature\n',
+            ),
+        ]
+
+        candidates = screen._collect_candidates(messages)
+
+        assert [candidate['message_id'] for candidate in candidates] == [
+            'cover-v2@example.com'
+        ]
+
+    @pytest.mark.asyncio
+    async def test_search_shows_each_batch_and_stops_when_full(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Show batches incrementally, preserve selection, and stop at capacity."""
+        seed_db('test-add-incremental', [])
+        app = TrackingApp('test-add-incremental')
+        now = datetime.datetime.now(datetime.timezone.utc)
+        first = make_msg(
+            'first@example.com',
+            '[PATCH] needle first',
+            body=MINIMAL_DIFF,
+            date=email.utils.format_datetime(now - datetime.timedelta(hours=1)),
+        )
+        second = make_msg(
+            'second@example.com',
+            '[PATCH] needle second',
+            body=MINIMAL_DIFF,
+            date=email.utils.format_datetime(now - datetime.timedelta(hours=9)),
+        )
+        release_second = threading.Event()
+        queries: List[str] = []
+
+        def search(query: str, **kwargs: Any) -> List[email.message.EmailMessage]:
+            """Return the first result, then wait before returning the second."""
+            queries.append(query)
+            if 'needle' not in query:
+                return [
+                    first,
+                    make_msg(
+                        'initial@example.com',
+                        '[PATCH] initial',
+                        body=MINIMAL_DIFF,
+                        date=email.utils.format_datetime(
+                            now - datetime.timedelta(hours=2)
+                        ),
+                    ),
+                ]
+            if sum('needle' in item for item in queries) == 1:
+                return [first]
+            if not release_second.wait(5):
+                raise TimeoutError('second search was not released')
+            return [second]
+
+        with (
+            patch('b4.get_pi_search_results', side_effect=search),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=4),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.pause()
+                    await pilot.press('E')
+                    await pilot.pause()
+                    await app.workers.wait_for_complete()
+                    screen = app.screen
+                    assert isinstance(screen, EditTrackedSeriesScreen)
+                    screen.query_one('#add-series-filter', Input).value = 'needle'
+                    await pilot.pause(0.6)
+
+                    assert len(queries) == 3
+                    items = screen.query(EditTrackedSeriesItem)
+                    assert [item.candidate['message_id'] for item in items] == [
+                        'first@example.com'
+                    ]
+                    lv = screen.query_one('#add-series-list', ListView)
+                    lv.focus()
+                    lv.index = 0
+                    await pilot.press('space')
+                    await pilot.pause()
+                    assert screen._selected == {'first@example.com'}
+                finally:
+                    release_second.set()
+
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert {
+                    item.candidate['message_id']
+                    for item in screen.query(EditTrackedSeriesItem)
+                } == {'first@example.com', 'second@example.com'}
+                assert next(
+                    item.selected
+                    for item in screen.query(EditTrackedSeriesItem)
+                    if item.candidate['message_id'] == 'first@example.com'
+                )
+                assert len(queries) == 3
+                assert all('dt:' in query for query in queries)
+                assert all(
+                    '(s:"needle" OR f:"needle")' in query for query in queries[1:]
+                )
+
+    @pytest.mark.asyncio
+    async def test_selection_follows_first_patch_when_cover_is_discovered(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Keep a selected series selected when its cover replaces patch one."""
+        seed_db('test-add-selection-cover', [])
+        app = TrackingApp('test-add-selection-cover')
+        date = email.utils.format_datetime(
+            datetime.datetime.now(datetime.timezone.utc) - datetime.timedelta(hours=1)
+        )
+        cover = make_msg('cover@example.com', '[PATCH 0/2] needle series', date=date)
+        first = make_msg(
+            'first@example.com',
+            '[PATCH 1/2] needle patch',
+            body=MINIMAL_DIFF,
+            in_reply_to='cover@example.com',
+            date=date,
+        )
+
+        with (
+            patch(
+                'b4.get_pi_search_results',
+                side_effect=[[first], [cover, first], [first]],
+            ),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                lv = screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.pause()
+                assert screen._selected == {'first@example.com'}
+
+                screen.query_one('#add-series-filter', Input).value = 'needle'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                item = screen.query_one(EditTrackedSeriesItem)
+                assert item.candidate['message_id'] == 'cover@example.com'
+                assert item.selected
+                assert screen._selected == {'cover@example.com'}
+                assert 'first@example.com' not in screen._candidates
+                assert screen._recent_ids == ['cover@example.com']
+
+                screen.query_one('#add-series-filter', Input).value = 'needle patch'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                items = list(screen.query(EditTrackedSeriesItem))
+                assert [item.candidate['message_id'] for item in items] == [
+                    'cover@example.com'
+                ]
+                assert items[0].selected
+                assert screen._selected == {'cover@example.com'}
+                assert 'first@example.com' not in screen._candidates
+
+                screen.query_one('#add-series-filter', Input).value = ''
+                await pilot.pause()
+                items = list(screen.query(EditTrackedSeriesItem))
+                assert [item.candidate['message_id'] for item in items] == [
+                    'cover@example.com'
+                ]
+                assert items[0].selected
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.pause()
+                assert not screen._selected
+
+    @pytest.mark.asyncio
+    async def test_selection_follows_grouped_revision(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """An older selected cover remains selected when its revision is found."""
+        seed_db('test-add-selection-revision', [])
+        app = TrackingApp('test-add-selection-revision')
+        date = email.utils.format_datetime(
+            datetime.datetime.now(datetime.timezone.utc) - datetime.timedelta(hours=1)
+        )
+        old = make_msg('v1@example.com', '[PATCH 0/2] needle feature', date=date)
+        new = make_msg(
+            'v2@example.com',
+            '[PATCH v2 0/2] needle feature',
+            in_reply_to='v1@example.com',
+            date=date,
+        )
+        with (
+            patch('b4.get_pi_search_results', side_effect=[[old], [new, old]]),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+                lv = screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.pause()
+                assert screen._selected == {'v1@example.com'}
+
+                screen.query_one('#add-series-filter', Input).value = 'needle'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                item = screen.query_one(EditTrackedSeriesItem)
+                assert item.candidate['message_id'] == 'v2@example.com'
+                assert item.selected
+                assert screen._selected == {'v2@example.com'}
+
+    @pytest.mark.asyncio
+    async def test_search_reaches_unbounded_history_with_no_gaps(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Empty searches cover contiguous windows through unbounded history."""
+        seed_db('test-add-history', [])
+        app = TrackingApp('test-add-history')
+
+        with patch('b4.get_pi_search_results', return_value=[]) as search:
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                screen.query_one('#add-series-filter', Input).value = 'nothing'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                queries = [
+                    call.args[0]
+                    for call in search.call_args_list
+                    if 'nothing' in call.args[0]
+                ]
+                windows = [
+                    re.search(r' AND dt:(\d{14})?\.\.(\d{14})$', query)
+                    for query in queries
+                ]
+                assert len(windows) > 7
+                assert all(windows)
+                assert windows[-1] is not None and windows[-1].group(1) is None
+                for previous, current in zip(windows, windows[1:]):
+                    assert previous is not None and current is not None
+                    start = datetime.datetime.strptime(
+                        previous.group(1) + '+0000', '%Y%m%d%H%M%S%z'
+                    )
+                    end = datetime.datetime.strptime(
+                        current.group(2) + '+0000', '%Y%m%d%H%M%S%z'
+                    )
+                    assert start - end == datetime.timedelta(seconds=1)
+                assert '0 matching series' in static_text(
+                    screen.query_one('#add-series-status', Static)
+                )
+
+    @pytest.mark.asyncio
+    async def test_new_filter_replaces_stale_search_and_refetches_cached_matches(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A new filter refetches matches and ignores a stale worker's results."""
+        seed_db('test-add-stale', [])
+        app = TrackingApp('test-add-stale')
+        recent_date = email.utils.format_datetime(
+            datetime.datetime.now(datetime.timezone.utc) - datetime.timedelta(hours=1)
+        )
+        cached = make_msg(
+            'cached@example.com', '[PATCH] second cached', body=MINIMAL_DIFF
+        )
+        stale = make_msg('stale@example.com', '[PATCH] first stale', body=MINIMAL_DIFF)
+        fresh = make_msg(
+            'fresh@example.com',
+            '[PATCH] second fresh',
+            body=MINIMAL_DIFF,
+            date=recent_date,
+        )
+        release_first = threading.Event()
+        queries: List[str] = []
+
+        def search(query: str, **kwargs: Any) -> List[email.message.EmailMessage]:
+            """Block the first search so its result arrives after the second."""
+            queries.append(query)
+            if 'first' in query:
+                if not release_first.wait(5):
+                    raise TimeoutError('first search was not released')
+                return [stale]
+            if 'second' in query:
+                return [fresh]
+            return [cached]
+
+        with (
+            patch('b4.get_pi_search_results', side_effect=search),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.pause()
+                    await pilot.press('E')
+                    await pilot.pause()
+                    await app.workers.wait_for_complete()
+                    screen = app.screen
+                    filter_input = screen.query_one('#add-series-filter', Input)
+                    filter_input.value = 'first'
+                    await pilot.pause(0.45)
+                    assert any('first' in query for query in queries)
+                    filter_input.value = 'second'
+                    await pilot.pause(0.45)
+                    assert any('second' in query for query in queries)
+                    assert [
+                        item.candidate['message_id']
+                        for item in screen.query(EditTrackedSeriesItem)
+                    ] == ['fresh@example.com']
+                finally:
+                    release_first.set()
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert [
+                    item.candidate['message_id']
+                    for item in screen.query(EditTrackedSeriesItem)
+                ] == ['fresh@example.com']
+                filter_input.value = ''
+                await pilot.pause()
+                assert [
+                    item.candidate['message_id']
+                    for item in screen.query(EditTrackedSeriesItem)
+                ] == ['cached@example.com']
+
+    @pytest.mark.asyncio
+    async def test_search_matches_subject_of_a_later_patch(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """A matching child patch retains its cover as the selectable result."""
+        seed_db('test-add-patch-search', [])
+        app = TrackingApp('test-add-patch-search')
+        date = email.utils.format_datetime(
+            datetime.datetime.now(datetime.timezone.utc) - datetime.timedelta(hours=1)
+        )
+        messages = [
+            make_msg('cover@example.com', '[PATCH 0/2] Network cleanup', date=date),
+            make_msg(
+                'patch1@example.com',
+                '[PATCH 1/2] Refactor network',
+                body=MINIMAL_DIFF,
+                in_reply_to='cover@example.com',
+                date=date,
+            ),
+            make_msg(
+                'patch2@example.com',
+                '[PATCH 2/2] Fix packet loss',
+                body=MINIMAL_DIFF,
+                in_reply_to='patch1@example.com',
+                date=date,
+            ),
+        ]
+
+        with (
+            patch(
+                'b4.get_pi_search_results',
+                side_effect=lambda query, **kwargs: (
+                    messages if 'packet loss' in query else []
+                ),
+            ) as search,
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                screen.query_one('#add-series-filter', Input).value = 'packet loss'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert [
+                    item.candidate['message_id']
+                    for item in screen.query(EditTrackedSeriesItem)
+                ] == ['cover@example.com']
+                assert (
+                    len(
+                        [
+                            call
+                            for call in search.call_args_list
+                            if 'packet loss' in call.args[0]
+                        ]
+                    )
+                    == 1
+                )
+
+    @pytest.mark.asyncio
+    async def test_search_does_not_count_old_roots_from_new_replies(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """An expanded old thread cannot stop the search before newer roots."""
+        seed_db('test-add-old-root', [])
+        app = TrackingApp('test-add-old-root')
+        now = datetime.datetime.now(datetime.timezone.utc)
+        old = make_msg(
+            'old@example.com',
+            '[PATCH] needle old',
+            body=MINIMAL_DIFF,
+            date=email.utils.format_datetime(now - datetime.timedelta(days=30)),
+        )
+        newer = make_msg(
+            'new@example.com',
+            '[PATCH] needle newer',
+            body=MINIMAL_DIFF,
+            date=email.utils.format_datetime(now - datetime.timedelta(hours=9)),
+        )
+        batches = iter([[old], [newer]])
+
+        with (
+            patch(
+                'b4.get_pi_search_results',
+                side_effect=lambda query, **kwargs: (
+                    next(batches) if 'needle' in query else []
+                ),
+            ) as search,
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                screen.query_one('#add-series-filter', Input).value = 'needle'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert [
+                    item.candidate['message_id']
+                    for item in screen.query(EditTrackedSeriesItem)
+                ] == ['new@example.com']
+                assert (
+                    len(
+                        [
+                            call
+                            for call in search.call_args_list
+                            if 'needle' in call.args[0]
+                        ]
+                    )
+                    == 2
+                )
+
+    @pytest.mark.asyncio
+    async def test_search_reports_network_errors_without_retrying_history(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Report a failed Lore search instead of searching older windows."""
+        seed_db('test-add-error', [])
+        app = TrackingApp('test-add-error')
+
+        def search_lore(query: str, **kwargs: Any) -> List[email.message.EmailMessage]:
+            if 'needle' in query:
+                raise OSError('server unavailable')
+            return []
+
+        with patch('b4.get_pi_search_results', side_effect=search_lore) as search:
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                screen.query_one('#add-series-filter', Input).value = 'needle'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert (
+                    len(
+                        [
+                            call
+                            for call in search.call_args_list
+                            if 'needle' in call.args[0]
+                        ]
+                    )
+                    == 1
+                )
+                assert 'Lore search failed: server unavailable' in static_text(
+                    screen.query_one('#add-series-status', Static)
+                )
+
+    @pytest.mark.asyncio
+    async def test_search_status_displays_literal_markup(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Display subjects, user searches, and errors without parsing markup."""
+        seed_db('test-add-markup', [])
+        app = TrackingApp('test-add-markup')
+        msg = make_msg('markup@example.com', '[PATCH] subject [/]', body=MINIMAL_DIFF)
+
+        def search_lore(query: str, **kwargs: Any) -> List[email.message.EmailMessage]:
+            if '[/]' in query:
+                raise OSError('failed [/]')
+            return [msg]
+
+        with (
+            patch('b4.get_pi_search_results', side_effect=search_lore),
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                lv = screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.pause()
+                assert screen.query_one(EditTrackedSeriesItem).selected
+                screen.query_one('#add-series-filter', Input).value = '[/]'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert 'failed [/]' in static_text(
+                    screen.query_one('#add-series-status', Static)
+                )
+
+    @pytest.mark.asyncio
+    async def test_filter_searches_lore_and_tracks_selected_series(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Search Lore, select a result, and pass it to the tracking helper."""
+        seed_db('test-add-search', [])
+        candidate = {
+            'message_id': 'cover@example.com',
+            'revision': 2,
+            'subject': '[PATCH v2] unique search subject',
+            'fromname': 'Unique Author',
+            'fromemail': 'unique@example.com',
+            'num_patches': 3,
+            'change_id': 'unique-change-id',
+            'date': None,
+        }
+        app = TrackingApp('test-add-search')
+
+        with (
+            patch(
+                'b4.get_pi_search_results',
+                side_effect=lambda query, **kwargs: (
+                    [make_msg('cover@example.com', '[PATCH] unique')]
+                    if 'unique' in query
+                    else []
+                ),
+            ) as search,
+            patch.object(EditTrackedSeriesScreen, '_visible_capacity', return_value=1),
+            patch.object(
+                EditTrackedSeriesScreen,
+                '_collect_candidates',
+                side_effect=lambda messages: [candidate] if messages else [],
+            ),
+            patch(
+                'b4.review.tracking.track_series_from_msgid',
+                return_value={'status': 'tracked'},
+            ) as track,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                original_screen = app.screen
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                assert isinstance(screen, EditTrackedSeriesScreen)
+
+                filter_input = screen.query_one('#add-series-filter', Input)
+                filter_input.value = 'unique'
+                await pilot.pause(0.45)
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                search_call = next(
+                    call for call in search.call_args_list if 'unique' in call.args[0]
+                )
+                assert search_call.args[0].startswith(
+                    '(s:"unique" OR f:"unique") AND dt:'
+                )
+                assert search_call.kwargs == {
+                    'nocache': True,
+                    'full_threads': True,
+                    'raise_errors': True,
+                }
+                lv = screen.query_one('#add-series-list', ListView)
+                items = [
+                    item
+                    for item in lv.children
+                    if isinstance(item, EditTrackedSeriesItem)
+                ]
+                assert [item.candidate['message_id'] for item in items] == [
+                    'cover@example.com'
+                ]
+                assert [
+                    item['message_id']
+                    for item in screen._filtered_candidates('unique@example.com')
+                ] == ['cover@example.com']
+                assert not screen._filtered_candidates('not-a-match')
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space')
+                await pilot.pause()
+                button = screen.query_one('#add-series-track', Button)
+                assert button.disabled is False
+                assert str(button.label) == 'Apply changes'
+                await pilot.click('#add-series-track')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                track.assert_called_once_with(
+                    'test-add-search', 'cover@example.com', b4.git_get_toplevel()
+                )
+                assert app.screen is original_screen
+
+    @pytest.mark.asyncio
+    async def test_cancelling_tracking_returns_completed_results(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """Cancelling a batch reports tracks completed before cancellation."""
+        seed_db('test-add-cancel', [])
+        app = TrackingApp('test-add-cancel')
+        messages = [
+            make_msg('first@example.com', '[PATCH] First', body=MINIMAL_DIFF),
+            make_msg('second@example.com', '[PATCH] Second', body=MINIMAL_DIFF),
+        ]
+        second_started = threading.Event()
+        release_second = threading.Event()
+        calls: List[str] = []
+
+        def track(identifier: str, message_id: str, topdir: str) -> Dict[str, str]:
+            """Finish one candidate, then wait for cancellation of the next."""
+            calls.append(message_id)
+            if len(calls) == 1:
+                return {'status': 'tracked'}
+            second_started.set()
+            if not release_second.wait(5):
+                raise TimeoutError('second track was not released')
+            raise liblore.OperationCancelledError('cancelled')
+
+        with (
+            patch('b4.get_pi_search_results', return_value=messages),
+            patch('b4.review.tracking.track_series_from_msgid', side_effect=track),
+            patch('b4.get_lore_node'),
+            patch.object(app, '_on_add_series', wraps=app._on_add_series) as callback,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                try:
+                    await pilot.pause()
+                    original_screen = app.screen
+                    await pilot.press('E')
+                    await pilot.pause()
+                    await app.workers.wait_for_complete()
+                    screen = app.screen
+                    lv = screen.query_one('#add-series-list', ListView)
+                    lv.focus()
+                    lv.index = 0
+                    await pilot.press('space', 'space')
+                    await pilot.pause()
+                    await pilot.click('#add-series-track')
+                    await pilot.pause()
+                    assert second_started.is_set()
+                    await pilot.press('escape')
+                    await pilot.pause()
+                finally:
+                    release_second.set()
+
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+                assert app.screen is original_screen
+                result = callback.call_args.args[0]
+                assert result['tracked'] == 1
+                assert not result['errors']
+
+    def test_tracking_results_report_each_failure(self, tmp_path: pathlib.Path) -> None:
+        """Partial successes report the subjects and reasons for failed tracks."""
+        seed_db('test-add-errors', [])
+        app = TrackingApp('test-add-errors')
+        with (
+            patch.object(app, 'notify') as notify,
+            patch.object(app, '_load_series'),
+        ):
+            app._on_add_series(
+                {
+                    'tracked': 1,
+                    'errors': ['First series: unavailable', 'Second series: rejected'],
+                }
+            )
+        notifications = [call.args[0] for call in notify.call_args_list]
+        assert 'First series: unavailable' in notifications
+        assert 'Second series: rejected' in notifications
+
+    @pytest.mark.asyncio
+    async def test_failed_tracking_reports_every_error_and_allows_retry(
+        self, tmp_path: pathlib.Path
+    ) -> None:
+        """An entirely failed batch reports each error and leaves the popup open."""
+        seed_db('test-add-all-errors', [])
+        app = TrackingApp('test-add-all-errors')
+        messages = [
+            make_msg('first@example.com', '[PATCH] First', body=MINIMAL_DIFF),
+            make_msg('second@example.com', '[PATCH] Second', body=MINIMAL_DIFF),
+        ]
+
+        def track(identifier: str, message_id: str, topdir: str) -> Dict[str, str]:
+            """Reject each candidate with a distinct error."""
+            raise OSError(f'cannot track {message_id}')
+
+        with (
+            patch('b4.get_pi_search_results', return_value=messages),
+            patch('b4.review.tracking.track_series_from_msgid', side_effect=track),
+            patch.object(app, 'notify') as notify,
+        ):
+            async with app.run_test(size=(120, 30)) as pilot:
+                await pilot.pause()
+                await pilot.press('E')
+                await pilot.pause()
+                await app.workers.wait_for_complete()
+                screen = app.screen
+                lv = screen.query_one('#add-series-list', ListView)
+                lv.focus()
+                lv.index = 0
+                await pilot.press('space', 'space')
+                await pilot.pause()
+                await pilot.click('#add-series-track')
+                await app.workers.wait_for_complete()
+                await pilot.pause()
+
+                assert app.screen is screen
+                assert not screen.query_one('#add-series-track', Button).disabled
+                notifications = [call.args[0] for call in notify.call_args_list]
+                assert any(
+                    'cannot track first@example.com' in text for text in notifications
+                )
+                assert any(
+                    'cannot track second@example.com' in text for text in notifications
+                )
+
     @pytest.mark.asyncio
     async def test_empty_database(self, tmp_path: pathlib.Path) -> None:
         """App should show empty message when no series are tracked."""

-- 
2.43.0

