Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050EE38C2C3
	for <tools@linux.kernel.org>; Mon, 12 Oct 2026 05:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791784720; cv=pass; b=ZtxJwTXZ5aZxgQGV4LsUq3ZMxkPAq/SpWBAZxu4MMuJDd4bc1l3FArvwnAheMffBfGTsDG4/p9Mhmv3XDevhWSdJ9Tg/UgbV90BDTOKRn2jL14ar5FiljjoL0c52FAji8K2bbc+4S+wroFOzb+msPw52OGVzBtTzHzMg396e2Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791784720; c=relaxed/simple;
	bh=8Xb2L1u7vUaDltNiI3UUV6YqukhKEITRZuyMVn1qh/8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OQiT2Tac8RAqUy81h6K2ug35gr0GOgpIQwpPnR3CQHNP3+jGkz9yJmsTPVxOPGqJMMFQUSF8Tx82ah4DwK62YLaoElEAoWpc1xb23wYSweW07P6iAef+EcmNDNqolEeqJwmD4uVC9XVCok3BKtehzZIOMF8gxJeVfR6oQO2+bFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ObE+M12p; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ObE+M12p"
Received: by smtp.kernel.org (Postfix)
	id 011F71F0089C; Mon, 12 Oct 2026 05:58:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1791784718;
	b=r85j3FJNAnycYxJ2K4fJIUUpdb2SUf2357wUvongbvvfYb/r227V7Ju3qEVTue6BLpi3
	 4Jin7WD6XHCobyptGnjTQCVz8tJHWavkPG6EzMWN2YEXidKpWAsNK/dmi9nkzldrY9vRW
	 MMrWOF+pQKnI+TIXkUeXzr/jMLz+BeFZOt5vX84288arna4crFpoqjclM8O2NuC6HHjOr
	 z6KNRInZvTbwrpXvXzxtM0qKeCTlhtTXwN8M4QtxGcO9rCEr1sb11UxETL5UGfi09U6wv
	 f0BN4Q9zw7cSCDEwwq+6XCGZBQ1pvwLfRijm1i3f0sdUVTil3aJiVqK+ZtKml8sjZKQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1791784718;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Subject:Date:
	 Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=dfcqpB+FOA1n+mN2kqD8xJQebQ2ylA6VueDcLy2oP7A=;
	b=oepWKc24ySD4nfLq0iipV+HxFCDW0Cibw1oyRRGlT0fYlxqxMxKgfOlFWknyb5G1BWqE
	 yzpthALGHB7lxCyXCjaARw42oSzGn03dNmlUyUnK5J4CBHStezlZyuikbXhLh4uNxb5Nb
	 vB1Xo3Bev5hYafrrv/EF8VCckLHFTIvJ9pvexV8xhRFSCDjJgJQ0RxEZv97+ypPjUwpBL
	 xVhCfgtR3hXALjIP1NDVCSzDNOVAdccWuHogvzqiA1yk/67E8Ww1XTb5htZHzFamTO+tv
	 +XCfpUZTSHVQh/ST6egjN7tRti0/QV2N89c31AzFboHQ40vatvcV8kH2rsEc7DFjGRQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ObE+M12p;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 634471F0089B
	for <tools@kernel.org>; Mon, 12 Oct 2026 05:58:38 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ObE+M12p
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 634471F0089B
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33c2520ad38so3417224eec.1
        for <tools@kernel.org>; Sun, 11 Oct 2026 22:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791784717; x=1792389517; darn=kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dfcqpB+FOA1n+mN2kqD8xJQebQ2ylA6VueDcLy2oP7A=;
        b=ObE+M12pnllyOw1Y74dXFpLKrQRGqHwmDJN8aHfWtskwfaran1JMxqskSYh9H+vtKe
         nmcRYp/8kmWzryp7vKbB9NOiFiluNnNhMArCUqJiAJmmMSaoiOXyXII/e43RNhISkF5F
         c7eCrZXw3Z5xng5YzzFy5E1MDrtiQBbidhLA93C4EoR/ZgVF+AUvDiVTgugqxfoUAEqe
         +fa/AEFaz1j3aK4XGYCynnBSomwtAY+yC5FAz5ZqZkms8QULa9yuY8RWd/NL8RvVyyPF
         tzgD1For1M1EqswjGQOBp8TF98vLxLDtsLoQoEHhLq3RU8wY2YrwzDAxyNjH6Wf6j03N
         6poQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791784717; x=1792389517;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dfcqpB+FOA1n+mN2kqD8xJQebQ2ylA6VueDcLy2oP7A=;
        b=oMo4R8EYJ5gLtuco+m/ABtxnYoRbGqVEs/2yLsvZa5y+UuPwfjBH/WlCQFj431acXv
         TdFtab0nBb0ZaoLl2JcT1Tf6cAFOsikPj9dZ1j9dBMNkQdm0dkbhqWUtR0i6IbruIX1V
         DRC6wrryDhnU26/vG1Yb9Ew2l+FxMLybT2yn8x8JzUtWwOdl87veOfL1dJl565XfFSHx
         XDhLt37cZPH6UtgEXKsBTLPV7UbiQKpsW5UJBYDogXp9tsKsaxZDOg53mnhKYhtBlmdS
         9LMeIx3mOYZeliggCi5TO0SXuPHAaQAzG8CjChJoKP3wVTSC/Xz8qQIru2P4uZpDw+Ub
         DyNw==
X-Gm-Message-State: AFq9FYLlcRoDErL862Z8AKZ0WBP6MMVSCjL+LElWqGyVMtYnBXNw8KDz
	Db1VYNwfWFHvJmQhHgcyxsi9HuErRUmZHwl6FCkhxhU022HK+JpbtbG3
X-Gm-Gg: AYBFou3o9OXJ78jb2TfrpKtaRuzhylg9NCcDA4EbwSak6snOb7d8uE/vJ1R7YEJ+V/6
	vl2mH48+haEHJcDgGbnt1zBhM63QHWLF3l9vuoKtoQH9Zg7/EUCc8/MLsGqsIQaUDR+CsvTP2Bx
	VRee2D4yAUJRoqh3Y8fMxKYd0iWWryOa2hLh7p2LosxhA4J8wcAUvBgTrTcOuu8CqypvQKj5ryJ
	690sFsTLD+uXkibavrIaBFwlztYLvMK+v35PPz0tR+0UES4/tHk4JzoG4XgUrAtnQHZJydOVD9W
	+/Vfu3URXYbZ9VhN6eHqujNsR4u3Ko5trNvs2NlpHwgPLDu5B3+f+Icw4Z0KX/z39cBwaQV62vg
	O3BfdFo3vMitOM7hNb3m5fqF7PqJ469zDZFMF02S16CTd1ICuFkixSmws5eksya8fhCA8xhMf6l
	k9AVuSsjaA9aTmir47X9Us0eyllQZPXgvaAJk+q4hJjRgrIcfcXna1Py30bU0+Dh7rVgzSO2stk
	cNuZbWGq9CevaLhf3RSNpsAgc+p+a79KICeDvFZdFlpIdynQE4kEHK3bCJwb24=
X-Received: by 2002:a05:7300:f582:b0:353:5ae1:b0f5 with SMTP id 5a478bee46e88-3537e101bf0mr12204413eec.26.1791784717314;
        Sun, 11 Oct 2026 22:58:37 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:8999:e631:ed58:366a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b19c6c7b4sm3101612eec.24.2026.10.11.22.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 22:58:36 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: [PATCH b4 v2 0/5] b4: Implement BCC support for patch submissions
 and review
Date: Sun, 11 Oct 2026 22:58:25 -0700
Message-Id: <20261011-send-series-bcc-v2-0-cd17584c40fb@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAF3zGoC/yWNQQ6DIBREr2L+uhhAUrSr3qNxofDV31ZpwJoa4
 92LuJzJezMbBPSEAW7ZBh4XCuSmGOQlAzM0U4+MbMwgubzyshAs4GTZKbHWGFbZTipuVVdUGqL
 18djRLy0+oFVQn134tk808zF1UAOF2fk13S4isemh4JoLqVWZCyWU5pIJZkea/ZpH3r0Gt9z7s
 aF3btwI9b7vfxtfppvCAAAA
X-Change-ID: 20260831-send-series-bcc-9df240d4f397
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
X-Mailer: b4 0.17-dev-36fec

This series implements support for sending patch series and review
replies to blind carbon copy (BCC) recipients.

The work is split into four parts:
1. Server-side support in misc/send-receive.py to receive optional BCC
   envelope destinations via the JSON submission payload and deliver
   them over SMTP while enforcing anti-abuse limits (max-client-bcc)
   and public mailing list destination checks (mustdest).
2. Client-side support in b4 to inject series-wide BCC addresses
   directly into envelope recipients (destaddrs) in send_mail() without
   adding or stripping temporary Bcc: headers. This extends BCC
   capability across sending tools (b4 send, b4 review, b4 ty) and
   supports web endpoint submission.
3. Per-message Bcc: header handling in send_mail() and the review/bugs
   TUIs, extracting Bcc: headers into envelope recipients and stripping
   them before signing and sending while rejecting them on the web
   endpoint.
4. Safety guardrails in ez.py to reject Bcc: trailers in patches and
   cover letters so they are never treated as person trailers and
   leaked into public Cc: headers.

---
Changes in v2:
- Added server-side support in misc/send-receive.py for web endpoint
  submissions.
- Handled series-wide BCC addresses directly in send_mail() as envelope
  recipients instead of adding/deleting temporary Bcc: message headers.
- Extended BCC handling to work across all workflows including b4 review
  and b4 bugs, properly extracting and stripping per-message Bcc:
  headers set in TUI dialogs.
- Added explicit guardrails in b4 send to reject Bcc: trailers in
  patches and cover letters to prevent privacy leaks.
- Added BCC recipient preview and count display in the review and bugs
  TUIs.
- Added unit tests in src/tests/test___init__.py and
  src/tests/test_ez.py.
- Link to v1: https://patch.msgid.link/20260307012748.1414702-1-dmitry.torokhov@gmail.com

To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

---
Dmitry Torokhov (5):
      misc/send-receive: support BCC in web submission endpoint
      b4: implement --bcc and send-series-bcc config option
      b4: handle per-message Bcc headers in send_mail and TUIs
      b4: reject Bcc trailers in patches and cover letter
      misc/send-receive: require messages payload to be a list

 docs/config.rst              |  13 +++-
 docs/contributor/send.rst    |  11 +++-
 misc/default.conf            |   2 +
 misc/send-receive.py         |  34 +++++++++-
 src/b4/__init__.py           |  55 +++++++++++++---
 src/b4/bugs/_tui.py          |   8 ++-
 src/b4/command.py            |   3 +
 src/b4/ez.py                 |  89 ++++++++++++++++++-------
 src/b4/review_tui/_common.py |   4 +-
 src/b4/review_tui/_modals.py |  25 ++++++-
 src/tests/test___init__.py   | 154 +++++++++++++++++++++++++++++++++++++++++++
 src/tests/test_ez.py         |  81 +++++++++++++++++++++++
 12 files changed, 437 insertions(+), 42 deletions(-)
---
base-commit: 0dee38458cbaa10a378fda3fcdd15a626fd92f6d
change-id: 20260831-send-series-bcc-9df240d4f397

Thanks.

-- 
Dmitry

