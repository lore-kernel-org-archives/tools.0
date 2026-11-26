Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795684044;
	b=Si/+2eOjYHO6Q/5FWAsiyGH0k3fxmwhQoNte/Lbr459IpWUNINDp3Vh1UKBG1VVr+mxU
	 M7GPCWqQLsRELRP8UMvdgIRgEKEk6XTpl87IfPHP0mNoZ1fP5qR+DIEzWrXQQA/e9x+u3
	 f2F/jrkQf79zFpFInp01GUw6CG0ieaKEyiAKpFZnRpS2qFMrneppp5RJv9BalDPr2qGG4
	 oyTfLgijxnUSOX/kxQ0pSnBEbGs5kT7H4vYgmzE/D8atAegsp884oWFwFeSqnCW0njxwY
	 EPZrOJGQUWfUYXPbxXtEcdtouHy79LvO6DgADnbCSjJuZaoZm+ZvjZxBOSI9OKkvIrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684044;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer;
	bh=QusCmog/JBvytbZXR+Y2gYrYH+hlvoo/QabUVWRNvwo=;
	b=anu4FuHwqp4QwIoDXtdIa2P42aeZFEA6fpqmAMMbARwjf1ksuJOk105gZQqBaMrBD5Z1
	 3AKVu5bhcdmEV1rvV8Enx/EK3yyJZBLcCEhLitSa2+v1Yrusa+s39/4jpnmx35hz+MJZq
	 Y0s89qRBMvAVqK2pIfdOk9C42s3pyNM8zPPbxRo1T7GjvzVbYhRDuwgeGCYHidYf24mgF
	 nGlsiZaVs2DUuLctXzVKcnH3g/PAFauk+MRKSjYhtY5KdN77ZrK56dwOZBHrJ7kquhBGg
	 iTHfTEwc0z9lJDLY5ES7Gy0U74FHX4e+NY4Ghv6KMPWLAhFJqPRMRwM5dhyt937/Iig==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nq45ot+7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DA1606A333
	for <tools@linux.kernel.org>; Thu, 26 Nov 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nq45ot+7
Received: by smtp.kernel.org (Postfix)
	id 818221F000E6; Thu, 26 Nov 2026 09:07:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795684043;
	b=aEQM73A68Puuadq2z3svuAcPrVqBY44YIEamI8lBfcIP+K6Jg3s4+OQ2bC1XK7SXF3sU
	 7XxrpVnpFMVeMV1cYIwSAR+5aQRUBWMvTpnqf8etIWNm5k+h7kcewiDecca+Y4jqgr4xY
	 SumgESY+dszfAJ+pUV4p5pVLn2zHhjQAJ3UaAC6UvwCrzsfRuGTHuElgM4j5o8lXphPAt
	 h3CdrGOOeRXxmsHkT+TlZ5q4l71llUwn4yfnmI/jFerhq7E6aQgA/O05umWwndCISvejS
	 v4TfcxMBW8J9zrGfXfsFAjnONiTLk/0BSTatYSSDoj7O7e2TJHDfZ6JQ3Bq8WVGy4pw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795684043;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=QusCmog/JBvytbZXR+Y2gYrYH+hlvoo/QabUVWRNvwo=;
	b=bWmBjjGEE3YM4wdBz0Oq7p1SRyjwrTDGvS1CmBeAbbenyUrUzu8bEsWVo9oGvx0c3oui
	 VfvODT67anuLBo1ZQN4j4HQQ9Ll3c4W2tUzgfi1iwHlRi3VjifgUPmngRfEV5tCLQH459
	 cLCDSTSstq9w1MXuNf7cPa26fDNkk8+RA3aTNDZDbkfEVoBaHq50URdzKVmkfHQrCNLqN
	 s0BkHegAaJzfCFh0XxnfMrhmDEW6uUn/qrnIIAkDmI72Ba0v8RmiTP23k3/A6vQ3kvhbS
	 J6ubDl2UdMyiczew8XmCPVju1nAny/kL3h449e8AOKoJ5y9XdFV2r5Vcsz5B227Nq4A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nq45ot+7;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7DB081F000C6
	for <tools@kernel.org>; Thu, 26 Nov 2026 09:07:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nq45ot+7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 7DB081F000C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-862bb0a189aso3209120a34.1
        for <tools@kernel.org>; Thu, 26 Nov 2026 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795684031; x=1796288831; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QusCmog/JBvytbZXR+Y2gYrYH+hlvoo/QabUVWRNvwo=;
        b=nq45ot+7p7AX7lKY86DIRyT8Rdt+pFHRmHc40haxd9ZWpgza7f0VDlNrZs7dPlt+AA
         ZJt3Ez2Sx5LgM+9qAQXYjQDdixMlbjqgQXCbJfEsRweSQSq+SxZIPp8d+ZQ1rEIUm8v/
         RUmZEel7Bzlk/aLOugxUW0T6xlMu108wOt4GWBtB6KUybKBNDMRlEFZPhTK7m2VL1elv
         mJ5+Ij/JIOz7LTnwL42eVb7hJkcMScNWTXGEURJMpz77JlYk6c/AF3sYaFeW4v0OfbA8
         bpxWvcRnc/5xd8t0uTAq5PIMsV+aNq10et8V0QbyNQsg2Eq/bkASwpZGn8A+1OvVHNF+
         3frw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684031; x=1796288831;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QusCmog/JBvytbZXR+Y2gYrYH+hlvoo/QabUVWRNvwo=;
        b=hTzb3Ams+EVyHBhKkfuA0MqDGE7u/qHSvh/rtpmmmOhuASjnw5AgRsLPSwMEt3Hr7f
         XkXKsPRTDU2cEFdBuoM+SwUTBTyTTyMCMqmyRRcDV0m+BHLCfKKlyRcMtAg8y0q2652W
         OQDt3RHMVCpPPO5eCDAzIa7GQMkUZVQqWNR2VlL/kFiPrvz5UCljsHBMcOXvwpWTDrCz
         HK+Ao8aWXxer9yd5p79113SnP6n5kWejTKFxyG8QMNbl94cx/a6A8UPCHVNhXBPYGwvF
         Sff7ohwhfUUGqeWlPGUTgUhO/NIxhTJeqRMN6XUf9pzxv95t58rxyBnGPXk2UfH5XzfN
         ncYA==
X-Gm-Message-State: APuU4Z8D5wbPRehP+mmAakanl53u9VO5A7x21y4XGe0EOZyv7tjN7j65
	q7LnXHKmzfZd9jl7mVNg1fUtE9e8/UxOQ+SuFI9Hw6h0Etb4sce2GBVGPUOqm6HU
X-Gm-Gg: AZFdTZd0s6d/pMxsWcbypMJLWaxLPjB+N7zGJI1poix9R8h1OjBGG4gVIQwW8PoxW5v
	df2exFm6lii7XhZ4Vxra/Op9kROBzsqOBOH6PZKX/uEx5MyZgQnPR7Wl23wFN7y73nzqZX53aTj
	roajcqCCDyc4+gzOKlQmXI9tecnypYNTLdCTQL+fWcw3g6tv8Zz5K66QjbkbZLBHrwnFWbKjL4K
	HWtZD6gbXzu+Bs2LOae1Z0rrMgmnMlB9K1xuTeMSjjkKYzP/qaFg9dFN9tECyqDNTWL/xpwOKy3
	ZbidDkK51yC1zOz+UPAJg9C4sftbE6MCqzvzjTHnh6PbKXu7WIH1a84Hxidr9QjeJJFqnCYvwfT
	yOatPnIOl8607Q2aY/5POCQpoIK+GjF6f5FdNICnaI7jZgh/VmYh3qBP0amJ4KW7Bwdk4h7M0Gd
	vOWtsB7Wq7AGmzwTO/GOeHD3VUEdmH2RfJ1v56SyeiKPirpbvWyv3uVJb175ciVt84m1WOc3v09
	/vZoUoBFMqSFAEHk2p0cPNqw+h66CpJXX2ya3Av9TXu8nCzHqOO/VK0XYaHCWdsS7hTkDUSYGG2
	scAFnpxEmvSFphc6nH6cjwbjXK0PPZzFbCdE53HtpuXp84YoMu0eNIckzSsKnK9G0/liLS5XzWj
	34S/MxJDxAPlbHdEtG2KhGwvBKBu+vtbsjLdqk7QZlTx/B6gLjow3VlNmAxwoBCNWyfAcphGhI8
	DqhsBvX/FVnQ/06LF5x0gz4TCwynDeAGJ5r0n8rv3jaCqBGus/8oGQ
X-Received: by 2002:a05:6830:4c0b:b0:862:b2c2:9abb with SMTP id 46e09a7af769-863157a6e65mr21510928a34.15.1795684031397;
        Thu, 26 Nov 2026 01:07:11 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631682200esm14448597a34.2.2026.11.26.01.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 26 Nov 2026 02:07:01 -0700
Subject: [PATCH b4 3/3] send: honor saved Bcc exclusion overrides on resume
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
Message-Id: <20261126-submit-b4-send-resume-fixes-v1-v1-3-cf5e018d8d7a@gmail.com>
References: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
In-Reply-To: <20261126-submit-b4-send-resume-fixes-v1-v1-0-cf5e018d8d7a@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.17-dev

An explicit Bcc can include an address matched by email-exclude. If SMTP
stops partway through the series, resume sees only the saved envelope
and refuses to continue, even if the exclusions have not changed.

Record which patterns each explicit Bcc overrode in the private send
state. Honor only those matches when checking the original envelope
again: a new matching rule still blocks delivery, even for the same
blind recipient. Old records carry no overrides and keep their current
checks. The wire messages do not change.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 docs/contributor/send.rst     |  3 ++-
 src/b4/_send.py               |  7 +++++++
 src/b4/ez.py                  | 22 ++++++++++++++++++----
 src/tests/test_send_resume.py | 34 ++++++++++++++++++++++++++++++++++
 4 files changed, 61 insertions(+), 5 deletions(-)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index e233710..80fa0d7 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -337,7 +337,8 @@ credentials may change; delivery still uses the original saved envelope
 sender and recipients. Recipient and signing options are not accepted with
 ``--resume``. Explicit ``email-exclude`` restrictions still apply: b4
 refuses to resume while a pending message has a recipient that matches
-one of them.
+one of them. A blind copy can still be delivered if the original Bcc
+overrode that exclusion. A new matching exclusion still blocks resume.
 
 To inspect the pending messages without sending anything, use::
 
diff --git a/src/b4/_send.py b/src/b4/_send.py
index 2db31d5..6831a4c 100644
--- a/src/b4/_send.py
+++ b/src/b4/_send.py
@@ -111,6 +111,8 @@ class State:
     next_cover: Optional[str] = None
     next_tracking: Optional[Dict[str, Any]] = None
     partial_reroll_hash: Optional[str] = None
+    # Explicit Bcc destinations can override email-exclude at submission.
+    bcc_overrides: Dict[str, List[str]] = field(default_factory=dict)
 
 
 class SendSession:
@@ -160,6 +162,8 @@ class SendSession:
         try:
             data = json.loads((directory / 'state.json').read_text())
             data['messages'] = [Message(**entry) for entry in data['messages']]
+            if not isinstance(data.get('bcc_overrides', {}), dict):
+                raise ValueError('Invalid Bcc exclusion overrides')
             session = cls(directory, State(**data))
             session.validate()
         except (OSError, ValueError, TypeError, KeyError) as exc:
@@ -172,6 +176,9 @@ class SendSession:
             raise ValueError('Invalid send state version or message list')
         if state.revision < 1 or type(state.finished) is not bool:
             raise ValueError('Invalid send revision/status')
+        _check_addresses(list(state.bcc_overrides))
+        for patterns in state.bcc_overrides.values():
+            _check_addresses(patterns)
         for value in (
             state.change_id,
             state.branch,
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 8db2cb7..d560035 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -3428,19 +3428,27 @@ def _finish_send(session: SendSession) -> None:
     )
 
 
+def _matching_excludes(addr: str, excludes: Set[str]) -> Set[str]:
+    return {
+        pattern.lower()
+        for pattern in excludes
+        if fnmatch.fnmatchcase(addr.lower(), pattern.lower())
+    }
+
+
 def _get_resume_smtp(
     session: SendSession, *, resolved_sent: bool = False
 ) -> b4.SMTPConnector:
     state = session.state
-    # Shell-style patterns, as cleanup_email_addrs() treats them
-    excludes = [pattern.lower() for pattern in b4.get_excluded_addrs()]
+    excludes = b4.get_excluded_addrs()
     for index, message in enumerate(state.messages):
         if not message.pending() or (index == state.in_flight and resolved_sent):
             continue
         if any(
-            fnmatch.fnmatchcase(addr.lower(), pattern)
+            _matching_excludes(addr, excludes).difference(
+                state.bcc_overrides.get(addr.lower(), [])
+            )
             for addr in message.recipients
-            for pattern in excludes
         ):
             raise RuntimeError(
                 'Saved recipients include an address now excluded by email-exclude; refusing to send'
@@ -4032,6 +4040,7 @@ def _cmd_send(
         assert sender is not None
         branch, head, tree, cover_hash = source
         series = tracking['series']
+        explicit_excludes = b4.get_excluded_addrs()
         state = State(
             change_id=series['change-id'],
             revision=series['revision'],
@@ -4043,6 +4052,11 @@ def _cmd_send(
             cover_message_id=cl_msgid,
             fromaddr=sender,
             messages=[],
+            bcc_overrides={
+                addr.lower(): sorted(matches)
+                for addr in send_bcc
+                if (matches := _matching_excludes(addr, explicit_excludes))
+            },
         )
         # Before saving: --resume sends what was saved without this check.
         _check_send_source(state)
diff --git a/src/tests/test_send_resume.py b/src/tests/test_send_resume.py
index ca31497..1c81c33 100644
--- a/src/tests/test_send_resume.py
+++ b/src/tests/test_send_resume.py
@@ -315,6 +315,8 @@ def test_changed_payload_is_rejected_before_connect(session: SendSession) -> Non
         {'finished': True},
         {'messages': []},
         {'revision': '4'},
+        {'bcc_overrides': []},
+        {'bcc_overrides': {'test@example.org': '*'}},
     ],
 )
 def test_corrupt_snapshot_rejected(
@@ -1304,6 +1306,7 @@ def test_bcc_survives_resume(
     send_repo: Path, monkeypatch: pytest.MonkeyPatch, source: str
 ) -> None:
     bcc = 'secret@example.org'
+    b4.MAIN_CONFIG['email-exclude'] = 'secret@Example.org,SeCrEt@*'
     if source == 'config':
         b4.MAIN_CONFIG['send-series-bcc'] = bcc
         args = ['--no-sign']
@@ -1313,6 +1316,7 @@ def test_bcc_survives_resume(
     configure_smtp(monkeypatch, first)
     with pytest.raises(SystemExit):
         run_send(*args)
+    b4.MAIN_CONFIG.pop('send-series-bcc', None)
     second = FakeSMTP()
     configure_smtp(monkeypatch, second)
     run_send('--resume')
@@ -1322,6 +1326,36 @@ def test_bcc_survives_resume(
     assert not any(bcc.encode() in data for _sender, _recipients, data in calls)
 
 
+@pytest.mark.parametrize('old_journal', [False, True])
+def test_resume_blocks_unrecorded_bcc_exclusion(
+    send_repo: Path,
+    monkeypatch: pytest.MonkeyPatch,
+    caplog: pytest.LogCaptureFixture,
+    old_journal: bool,
+) -> None:
+    bcc = 'secret@example.org'
+    b4.MAIN_CONFIG['email-exclude'] = bcc
+    configure_smtp(monkeypatch, FakeSMTP({}, smtplib.SMTPDataError(421, b'later')))
+    with pytest.raises(SystemExit):
+        run_send('--no-sign', '--bcc', bcc)
+    if old_journal:
+        saved = pending_session(send_repo)
+        assert saved is not None
+        path = saved.directory / 'state.json'
+        data = json.loads(path.read_text())
+        del data['bcc_overrides']
+        path.write_text(json.dumps(data))
+    else:
+        # Keep the original exact match but add a new rule for the same Bcc.
+        b4.MAIN_CONFIG['email-exclude'] = f'{bcc},secr*@example.org'
+    second = FakeSMTP()
+    configure_smtp(monkeypatch, second)
+    with pytest.raises(SystemExit):
+        run_send('--resume')
+    assert not second.calls
+    assert 'now excluded by email-exclude' in caplog.text
+
+
 def test_cli_permanent_refusal_finishes_with_a_warning(
     send_repo: Path, monkeypatch: pytest.MonkeyPatch, caplog: pytest.LogCaptureFixture
 ) -> None:

-- 
2.53.0

