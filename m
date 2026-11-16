Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794852042;
	b=lpf2N4SRMH0GODswa8dilmw291+yAdMRyer6b9hAE3T1EnpcSOXA5aOjKBtEIGxMBJ/S
	 xmVCj+TwRCd+ZHvUO/q9bBXyf4jK8qvfOePMzGABLm6VP8bO/3eV96sJNDgPgg0IfNIxb
	 is8nKLsC13jJfwT6eCGnwyOxzK3SPBMXgnavOrc1fMR5e+2rbBEZ6zVgdV8NUXPatHEVU
	 SUg28vSbLxxkPv3RhmD0Oa/MWxhyooY8K+2NMQh3Q7o1YhpWuplJQZEFnyJ3SACQFrlMU
	 5LQ/r0g2Aifiz6Xlp7FFcPj0I0HNw+k5dp5K/5hH4M9tSskev6dqzMZeHeRTCGEOvnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794852042;
	h=Received:Delivered-To:Received:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=p9+P+GaaSja5AmFp193zAqhfBlfXj0rw49DwqByBrn0=;
	b=iFqRfPygWMuDzP6XeFNzC8z1WAcAbLv5lB9Uuhnog+0048WjDeBznuK496D0E8FoYyJm
	 BBrHSg4SXAhi3NZy85ZquT8+ZNCFhzcxo/nqCRTCR1J3CzbHJXDcbp34XSKo5gE1ukxib
	 qvIy1TE/VvnAx5WrSci4YsygdVfuA3HDFqIxEFP9TPfB/5uNSJSVCxL+Eso0aCLtAtiBx
	 OTOwWV6pT+ip5crhU9AVqvzHmdIYLs7dER1aUpbs/YVANiGcy+KlHB3lSsL+pz2AvAFWC
	 0dTNB5PljlLOJ1lll+7hhmP+JC1ig26MXh/kQXBxjrrqUE5PgjjGcjurFcvOobo6Ozw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjU5YQKm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4068C606A886
	for <tools@linux.kernel.org>; Mon, 16 Nov 2026 18:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MjU5YQKm
Received: by smtp.kernel.org (Postfix)
	id 331C11F000CA; Mon, 16 Nov 2026 18:00:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F441F000CC;
	Mon, 16 Nov 2026 18:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794852042;
	bh=p9+P+GaaSja5AmFp193zAqhfBlfXj0rw49DwqByBrn0=;
	h=From:Date:Subject:To:Cc;
	b=MjU5YQKmOBMwNj3GBrwkyoW+/OOB66+eLwd2UXIqfG+48nK8iqjD/lVssyQ+sX9bj
	 O94xJsj25yiJxIYVQEaVDvw1GqDisCCdw35E0eLkPLq3FbzSvSyH9FuojFHjOcZLlw
	 7ObjddjmyhX/gOT/W/VEih4QnGox9oE0y6FqBfxfzzb+zr2K8YNp36ren9TwhLB4EF
	 0oXRAH+tl2V4QbnsMCKH0hdXivg8FrtIEr4aHAF6Q9JdfFJ1hYiAZj4SXfgMDWcMjk
	 dMwhWhnmscgq/YqJ0jyTeD9+UMLVhOClmhZHELw7fMhFif9D0FVOeRO1kSKP4Lc7ze
	 2Zdh8R1/JNLiA==
From: Brian Masney <masneyb@kernel.org>
Date: Mon, 16 Nov 2026 13:00:34 -0500
Subject: [PATCH b4] tests: ty: explicitly set master branch
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
Message-Id: <20261116-tests-master-branch-v1-1-ead9f70c580f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/yXMQQrCMBAF0KuEv+6AE0oWuYq4SNKJHcEomSiF0
 ruLun2Lt8Okqxii29HlraaPhuh4cihralchXRAd/MkHZg40xIbRPdmQTrmnVlbySaqfl1C4Cia
 HZ5eq2289I8+4/M1e+SZlfDscxweKjuQOewAAAA==
X-Change-ID: 20261116-tests-master-branch-2aef24d6c1fe
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Brian Masney <masneyb@kernel.org>
X-Mailer: b4 0.17-dev-556f0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=WyLW9H/7GcQiQiadOzEET8VSmNXCe9WRDlFQs/Ualvg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJ+uxx5IeoX4LradUX/zNUC91+VXPD5viz8raG64ob9i
 cuWLbBa2VHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBE4lcxMnzw/zPp0nOxna+V
 ZN0tDQNOeVZEqU7tlGeebpzxTaLxmwUjw89HUi0b7O4kL0llnaXxX+WYQc2OzI0zT/I9nHuWf0a
 RHBsA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

The tests assume that the name of newly created branches is master.
However if a user has it set to main in their .gitconfig, then this will
cause the tests to fail. Let's explicitly set the branch name to what
the tests expect when the repository is initialized.

Assisted-by: LLM
Signed-off-by: Brian Masney <masneyb@kernel.org>
---
 src/tests/test_ty.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 269ce021306f..c9a24f8748f1 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -401,7 +401,7 @@ def test_get_check_repo_config_override(monkeypatch: pytest.MonkeyPatch) -> None
 
 
 def _init_repo(path: str) -> None:
-    ecode, out = b4.git_run_command(None, ['init', path])
+    ecode, out = b4.git_run_command(None, ['init', '-b', 'master', path])
     assert ecode == 0, out
     b4.git_set_config(path, 'user.name', 'Test')
     b4.git_set_config(path, 'user.email', 'test@example.com')

---
base-commit: ce4c1158edb292caca0ce4a6087e5edecc1b0371
change-id: 20261116-tests-master-branch-2aef24d6c1fe

Best regards,
--  
Brian Masney <masneyb@kernel.org>

