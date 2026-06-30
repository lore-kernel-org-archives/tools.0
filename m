Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E649738F928
	for <tools@linux.kernel.org>; Tue, 30 Jun 2026 13:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782826899; cv=none; b=MH3vNIWmlOw032JmyKZPy+YN3oZ4YcYSY6WRqJwk+ygGO1j1TETffhvoQDMORHb/xX94p832atCMbaD1f1/DBqmbqk5s3LgmwzUxhcj/owjn8AhVwmpwdufczL5Sk3UdbAJfsk+yJmuv5pG9lP1B2ZcJCC50GvmSEOR8582OO9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782826899; c=relaxed/simple;
	bh=wbyFrSHmI2N6WTGaYNxmb7zDmv6Lcbhz1Vzluq37aZs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Hn+B2FmObytvHORMCh2MQtzTh9seupl2QdFCL9c8QSpf5H5oR9uCC0zziHU2DogleFgZn93ZJ8U8JO14zl+GhL+reFt97p/rg2/uEKHILNrQS6r+fm+PFuS14Rqm3P8HsbH2f0CxDvrY6uEkZkW+6W0TEmzpo21Q+Q+itJ2zwp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yp5eCe5o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yp5eCe5o"
Received: by smtp.kernel.org (Postfix)
	id BB5B51F00A3A; Tue, 30 Jun 2026 13:41:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39A41F000E9;
	Tue, 30 Jun 2026 13:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782826898;
	bh=8SDYW6e015hrM/Z1/bEh/hI8P1I1o0AlSO68tOVGrwU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Yp5eCe5oo5RlsdHxFE+3JQGg6X9oFjqtFcdlA2F+05H7yGzLlgqWarxOA3CfcvROm
	 MQaiIjTSjspkca4bTiUg1GTvd8jkz7jkDM42y2vvatMKFwO+2CLBANcb5BP7rCcIx3
	 trzcWCpwEPwdc5uyvb/F8supXzlo5WP2iT3qWrLF1aKqrJfYLndsohTYUGCSiTSTHB
	 S0oS7cDUecJkAk1ch+VQNuVVhvvdsmPWQXHCSVAqrbaorLNvdCXvV0z8/96vjhevXW
	 vTvA06g90vtaWA59Jc1uX/ivHCIayoDTAB51rPUzcScsijOonbv1K2WOQ8GP6V9vDK
	 8ctlCzH9fLvHg==
From: Christian Brauner <brauner@kernel.org>
Date: Tue, 30 Jun 2026 15:41:33 +0200
Subject: [PATCH b4 2/2] review-tui: test null Patchwork series name in bulk
 set-state
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-review-tui-null-series-name-v1-2-67d7c9334454@kernel.org>
References: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
In-Reply-To: <20260630-review-tui-null-series-name-v1-0-67d7c9334454@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Christian Brauner (Amutable)" <brauner@kernel.org>
X-Mailer: b4 0.16-dev-7d1c2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3496; i=brauner@kernel.org;
 h=from:subject:message-id; bh=wbyFrSHmI2N6WTGaYNxmb7zDmv6Lcbhz1Vzluq37aZs=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWQ5H+8/s1+H0afAZunfdofOtdz/lkR9bDJ9fZnxz4Q47
 82G6+w+dJSyMIhxMciKKbI4tJuEyy3nqdhslKkBM4eVCWQIAxenAEzEx42RYZfQkvCM3k4LlUyr
 615HrxjE8x05/kjAwcTvGTfToX+BlxgZDsivzH0R9aCeX1PrqvKu/30zc9p33NdjXB8dmOmwbl4
 KIwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624

Add a regression test that drives the set-state action on a series whose
name is None. Before the fix the apply-state modal raised VisualError
("unable to display 'NoneType'") while laying out its heading Label; the
test asserts the modal now renders the '(no subject)' placeholder instead.

The apply worker -- the only thing the modal's on_mount starts -- is stubbed
out so the modal stays mounted for inspection and never touches the network,
while the compose + layout pass that used to crash still runs.

Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
---
 src/tests/test_tui_pw.py | 44 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_tui_pw.py b/src/tests/test_tui_pw.py
index 2360166..755064b 100644
--- a/src/tests/test_tui_pw.py
+++ b/src/tests/test_tui_pw.py
@@ -21,7 +21,7 @@ import b4.review
 import b4.review.tracking as tracking
 import liblore
 from b4.review._review import PwFetchResult
-from b4.review_tui._modals import SetStateScreen
+from b4.review_tui._modals import ApplyStateModal, SetStateScreen
 from b4.review_tui._pw_app import PwApp, PwFetchProgress
 
 # ---------------------------------------------------------------------------
@@ -685,3 +685,45 @@ class TestPwBulkSetState:
             app.action_set_state()
             await pilot.pause()
             assert not isinstance(app.screen, SetStateScreen)
+
+
+class TestPwSetStateNullName:
+    """A Patchwork series with a null ``name`` must not crash set-state.
+
+    Patchwork returns ``name: null`` for a series with no cover letter. The
+    bulk set-state path built the apply modal's heading with
+    ``series.get('name', '(no subject)')``, whose default only applies when the
+    key is *absent* -- a present-but-None name sailed through as ``None`` into
+    ``ApplyStateModal``'s Label, which Textual refuses to render ("unable to
+    display 'NoneType'"). It must fall back to '(no subject)'.
+    """
+
+    @pytest.mark.asyncio
+    async def test_null_name_falls_back_to_no_subject(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        # Skip the apply worker (the only thing on_mount starts) so the modal
+        # stays up and off the network; we just need it to compose and lay out
+        # its Labels -- the render pass that raised VisualError before the fix.
+        monkeypatch.setattr(ApplyStateModal, 'on_mount', lambda self: None)
+
+        series = _mk_series(1)
+        series['name'] = None
+        _install_series(monkeypatch, [series])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_set_state()
+            await pilot.pause()
+            assert isinstance(app.screen, SetStateScreen)
+            await app.screen.dismiss(('reviewing', False))
+            # Mounting + laying out the modal is what crashed before the fix;
+            # reaching the assertions at all proves it now renders.
+            await pilot.pause()
+
+            modal = app.screen
+            assert isinstance(modal, ApplyStateModal)
+            assert modal._series_name == '(no subject)'
+            label = modal.query_one('#apply-series', Label)
+            assert _static_text(label) == '(no subject)'

-- 
2.53.0

