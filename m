Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079AA547068
	for <tools@linux.kernel.org>; Thu, 15 Oct 2026 00:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792022658; cv=none; b=lfPI3j46ItyzmpI5LO/6QB0MDHQtWTzfudRNnKJDHFPBb473bwVyx8a+N/8AnOvfJRvWyPpMsICuRBxf8dbIKxNgpYQYVZaqTGY1WSfMDQtLTYPITteE8QwmLNgbz0Mn655PnbqeTF/Lcdq2BcE7V4hAPAf/4/zF4tGi2q0mDSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792022658; c=relaxed/simple;
	bh=3VbVTCcwaPKKATm3yT7kqJciY17ijJhtv0ves42+fPs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4DWzAKQydnEcpNuzpgWUK+fRbHLpihlT4/NmTRBBAMptRnKnv1SG6QX3rZvOFx5fI/Z15BQWRXOzVDjrSU/VamnAwjSYJfmOVT8bRfpDov8+lWzQ2QLW4Kl6VahSvDrDcVlclvrGkbQGN5Jq/vTmAkjHPE/kIRV9+LelY8Z/JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9LMqzNa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9LMqzNa"
Received: by smtp.kernel.org (Postfix)
	id 9E1611F000C5; Thu, 15 Oct 2026 00:04:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263D01F000C8;
	Thu, 15 Oct 2026 00:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792022656;
	bh=BrKtT8OejlvY3vcurfom3ohhe6YJYOgb89NZ8QeV1bY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=N9LMqzNajl8PQNrIsXQTyQyc5jFq1uW0TXIkPBD6ZaDBDj9P0xe25kx74zivI8+7U
	 d/8BWG7g//0dcz7gDNKPqrCDFNAazarREubrOKtLiaRKZ40fxtqAO9LhAYN/wntt0g
	 TRs3vfP94n0akruaaGXW7Q8yqkO/lYJusJdv62O5GjXRp8V/CBdCVF6ZnDYqoJrZ9K
	 YC2A+4tRbJm3shkouPyI7WurtLzyUirMBvl4PFWBP2t4lCEtuassMlwRGU6StCHgIm
	 aj4lOmr1/rO0D4VI3iDaE49mnLWzfrTcetXOTIVGCVXd4XCQDkekxmuMCBmVy2CW0K
	 TCcmEB32C7NyA==
From: Brian Masney <masneyb@kernel.org>
Date: Wed, 14 Oct 2026 20:03:38 -0400
Subject: [PATCH b4 1/4] review-tui: show why a Patchwork update failed
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261014-pw-delegate-v1-1-a393ae92152a@kernel.org>
References: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
In-Reply-To: <20261014-pw-delegate-v1-0-a393ae92152a@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6890; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=3VbVTCcwaPKKATm3yT7kqJciY17ijJhtv0ves42+fPs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIuSNTcVvVQ27fL+X7086zTW1T/nO/leN4m/Pphxc3nU
 xQmxPuXdJSyMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjCRs9yMDLvqbOqNs3wOzN0n
 8vRt8t69OzOWV95k3yQ6R0zcdUNmQz4jw4fH/4Nzpx8UmsLkrcXe1lB1Orcn1llFn1Gr6Lpq+RZ
 WLgA=
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

When Patchwork rejects a state change, the Patchwork browser only says
"N updated, M failed", and the server's reason is thrown away. That
leaves the user guessing whether it was a permission problem, a bad
value, or the server being down. Keep the reason from the first patch
that failed and add it to the notice.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/b4/review_tui/_modals.py | 36 +++++++++++++++++++++++++++--
 src/b4/review_tui/_pw_app.py |  5 +++-
 src/tests/test_tui_pw.py     | 55 ++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 93 insertions(+), 3 deletions(-)

diff --git a/src/b4/review_tui/_modals.py b/src/b4/review_tui/_modals.py
index 8a0f46444a01..d1b878870b92 100644
--- a/src/b4/review_tui/_modals.py
+++ b/src/b4/review_tui/_modals.py
@@ -2716,6 +2716,29 @@ def SetStateConfirmScreen(
 PW_PATCH_TIMEOUT = 30
 
 
+def _pw_error_text(ex: Exception) -> str:
+    """Describe a failed Patchwork request, preferring the server's reason.
+
+    Patchwork answers a rejected PATCH with a JSON body mapping each field
+    to its errors, e.g. ``{"delegate": ["User 'x' is not a maintainer..."]}``.
+    """
+    rsp = getattr(ex, 'response', None)
+    if rsp is None:
+        return str(ex)
+    try:
+        body = rsp.json()
+    except ValueError:
+        body = None
+    if isinstance(body, dict) and body:
+        parts = []
+        for field, errs in body.items():
+            if isinstance(errs, list):
+                errs = ' '.join(str(e) for e in errs)
+            parts.append(f'{field}: {errs}')
+        return '; '.join(parts)
+    return f'{rsp.status_code} {rsp.reason}'
+
+
 class ApplyStateResult(NamedTuple):
     """Outcome of an ApplyStateModal run."""
 
@@ -2725,6 +2748,8 @@ class ApplyStateResult(NamedTuple):
     new_state: str
     # True when the user stopped the run with Esc before it finished
     cancelled: bool
+    # Why the first failed patch failed, as the server put it ('' if none)
+    error: str = ''
 
 
 class ApplyStateModal(ModalScreen[ApplyStateResult]):
@@ -2785,6 +2810,7 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
         self._series_name = series_name
         self._done_ids: Set[int] = set()
         self._fail = 0
+        self._error = ''
         self._cancelled = False
 
     def compose(self) -> ComposeResult:
@@ -2812,7 +2838,11 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
 
     def _result(self) -> ApplyStateResult:
         return ApplyStateResult(
-            set(self._done_ids), self._fail, self._new_state, self._cancelled
+            set(self._done_ids),
+            self._fail,
+            self._new_state,
+            self._cancelled,
+            self._error,
         )
 
     def _apply_states(self) -> ApplyStateResult:
@@ -2841,8 +2871,10 @@ class ApplyStateModal(ModalScreen[ApplyStateResult]):
                     )
                     rsp.raise_for_status()
                     self._done_ids.add(patch_id)
-                except Exception:
+                except Exception as ex:
                     self._fail += 1
+                    if not self._error:
+                        self._error = _pw_error_text(ex)
 
                 # Update progress from worker thread
                 self.app.call_from_thread(self._update_progress, i + 1)
diff --git a/src/b4/review_tui/_pw_app.py b/src/b4/review_tui/_pw_app.py
index 7e49b399d885..6e99488d7e35 100644
--- a/src/b4/review_tui/_pw_app.py
+++ b/src/b4/review_tui/_pw_app.py
@@ -821,7 +821,10 @@ class PwApp(LoreNodeShutdownMixin, App[None]):
                 severity='warning',
             )
         elif result.fail:
-            self.notify(f'{ok} updated, {result.fail} failed', severity='warning')
+            msg = f'{ok} updated, {result.fail} failed'
+            if result.error:
+                msg += f': {escape(result.error)}'
+            self.notify(msg, severity='warning')
         elif len(targets) == 1:
             self.notify(f'{ok} patch(es) set to {new_state}', severity='information')
         else:
diff --git a/src/tests/test_tui_pw.py b/src/tests/test_tui_pw.py
index 466b36517895..c7af958e895f 100644
--- a/src/tests/test_tui_pw.py
+++ b/src/tests/test_tui_pw.py
@@ -16,6 +16,7 @@ from typing import Any, Dict, List, Optional
 from unittest import mock
 
 import pytest
+import requests
 
 pytest.importorskip('textual')
 
@@ -875,3 +876,57 @@ class TestPwSetStateNullName:
             assert modal._series_name == '(no subject)'
             label = modal.query_one('#apply-series', Label)
             assert static_text(label) == '(no subject)'
+
+
+class TestPwApplyErrorText:
+    """A rejected PATCH reports the server's reason, not just a count."""
+
+    @pytest.mark.asyncio
+    async def test_failure_reason_in_notice(
+        self, monkeypatch: pytest.MonkeyPatch
+    ) -> None:
+        class _RejectingSession(_FakePwSession):
+            def patch(
+                self,
+                url: str,
+                data: Any = None,
+                stream: bool = False,
+                timeout: Optional[float] = None,
+            ) -> _FakeResp:
+                super().patch(url, data=data, stream=stream, timeout=timeout)
+                rsp = requests.Response()
+                rsp.status_code = 400
+                rsp.reason = 'Bad Request'
+                rsp._content = (
+                    b'{"state": ["Object with slug=reviewing does not exist."]}'
+                )
+                raise requests.HTTPError('400 Client Error', response=rsp)
+
+        fake = _RejectingSession()
+        monkeypatch.setattr(
+            b4, 'get_patchwork_session', lambda key, url: (fake, 'https://pw/api')
+        )
+        _install_series(monkeypatch, [_mk_series(1)])
+        app = PwApp('k', 'https://pw.example.org', 'proj')
+        notices: List[str] = []
+        orig_notify = app.notify
+
+        def _notify(message: str, *a: Any, **k: Any) -> None:
+            notices.append(message)
+            orig_notify(message, *a, **k)
+
+        monkeypatch.setattr(app, 'notify', _notify)
+        async with app.run_test(size=(120, 30)) as pilot:
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+            app.action_set_state()
+            await pilot.pause()
+            await app.screen.dismiss(('reviewing', False))
+            await pilot.pause()
+            await app.workers.wait_for_complete()
+            await pilot.pause()
+
+            assert app._all_series[0]['state'] == 'new'
+            assert (
+                '0 updated, 2 failed: state: Object with slug=reviewing does not exist.'
+            ) in notices

-- 
2.55.0

