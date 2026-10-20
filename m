Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792490208;
	b=rBwTiIw/5XrXVC7FDjsXBWlXS5kPLKiJeiCRO8SfLAJZRQsc4W3MgcTS1tRqRv86YN0R
	 LoSuI0jSUCILXspXe6L/zOqE/i/vHwREkXXblFYppkMN71PGGe05xRzRFHOFklX9O3iUA
	 iO6UKa+gtoR3LEulFx9SbWvtJE2btL4vvyw5nbuUTMK6YAUCwVB9ba9wPjvQ1m0UnlwTv
	 dK2ZL+jLZlRU9du6Xjf5LIHWaH+vKRGtl8dA3GWn84chNuyeFCJFOmV7Sr69hgM0HNBBJ
	 nT+K+9xFqxPblYD2Mde9auaLR4NOFeOHGDZanz5rdsiTjtymK2n3O2uBTUPTsiM2IDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792490208;
	h=Received:Delivered-To:Received:DMARC-Filter:X-Envelope-To:
	 DKIM-Signature:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=i5xd568iE37IVMtWN2DYTcniLSLMVeKfrb6iFCD0Osk=;
	b=YNO6abcvR8tUdHJzvcw6WZV9DADuJKYuqrGtyHm1Hd3NL8zcGOYDHw/j/Angrgc+ijhU
	 p2gP1zH+Pdduad1Oqeuwp2JRoJ+h2B66WjcBHCkh+4oJR3ATRegtey8YlAbazXktl1g0j
	 MWArrwPFPLtbIGM5KJH4ao/be620eGHTI2hwwaZ/DWdjJG7U2JSjW2lslaAAQc0fBP+kR
	 Ts/ZnS4mUlMeq8sVgarONTzRNnzUFTmX6eVDidrH+3f7U+bkyI2o4WsS0ImoY32sje3Fd
	 aHCfdkaTaLP6A0XcibfJWSgEc/T7lDkucNvd4JUVa+GshbUtIpKMnxzXSryTjaQpc9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="VJ/6Lpmk";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C15606A31D
	for <tools@linux.kernel.org>; Tue, 20 Oct 2026 09:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VJ/6Lpmk
Received: by smtp.kernel.org (Postfix)
	id 057071F000C4; Tue, 20 Oct 2026 09:56:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=95.215.58.67
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792490207;
	b=ihLwsD6JnD3rgLnCH7UdQg/rFi7Zz5xQ+jwyFbtfMYvKndoM8SyzQ1aXGoq94idnKLiH
	 MsSpf/tUJYZPl3xWQFDyU/0MlZ4+zVD1cgn99efmEfDE0t2bQk2zik3G+hIemDd2cbgxN
	 LrK/JNwggoF8saxvaYjniCsVKeEjwcgUNqY4lYHFPa+PtNKZ092y86ycapi+8l4hNYvMW
	 X3qvuD2XXVyicySmy4iioHZXT5KL7Y5rTQM09TgyUDNy8p5BW8HCGCM8gD1fNyjs4SeVP
	 ocevB/ysGtp7OLAb27Eo/YrEN9yZGL1Yg+JFKbSeq4ZcIb9kqadBI8NiDHAGXRI4loQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792490207;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer;
	bh=i5xd568iE37IVMtWN2DYTcniLSLMVeKfrb6iFCD0Osk=;
	b=2jDA8IIc85U7dlsbGmD/Y5+MLZxUfVxNA5fmus0BqtzBDEubAOgNih5b8RbEL6/GhQKH
	 KDOsFDzW8QiMzYcX9Ps4jmYzx0fTFiRWw8I6dlisHbyK9gcFK+1bl6+0nh5+Veo/p4Qde
	 2ZaIqEWSLw1QXhuVtiMBd0xmhprZK9VXEBP/IqTJBP+yaQWE8tX1GhRGU4DIUTO/EisCL
	 OmSW6dNexGF/11+o6aoezSDKxu0p8iXc5ceY9LvJDmm+ZGk6D3G7VWoVKuyRmA+kmUXs9
	 KUNrF/7VAnFDg9EAN6bfYwI7n3/efQUM93ru3oX+2ikxiwBcL9vzZlz/G5IjKcNSPQw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="VJ/6Lpmk";
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	arc=none smtp.remote-ip=95.215.58.67
Received: from mta1.migadu.com (out-67.mta1.migadu.com [95.215.58.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DF50E1F000C7
	for <tools@kernel.org>; Tue, 20 Oct 2026 09:56:46 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=VJ/6Lpmk
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org DF50E1F000C7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: tools@kernel.org
DKIM-Signature: a=rsa-sha256; bh=x+C0QqcDfapiL021DPjsyla8cxpQ12983HJCrS6pvak=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792490205; v=1; x=1793095005;
 b=VJ/6Lpmk64aHW8dujjpHUeZJhXyzHawHrulhXeXUW20audMj292v6LWZO5wE0Hs8zvxKV4qJ
 oA7ip8AoAEowe/iOa+UsPyAlngwibdoIPxYYH4LGoRHmVISIohjDbCLQVnSIdg9V/fKQpHouLph
 j9yzpf0zn0Z4G7N5J8WQ7t/A=
X-Envelope-To: tools@kernel.org
Received: by mta11.migadu.com with ESMTPS id 2b4d5000a6ed5f77;
	Tue, 20 Oct 2026 09:56:44 +0000
X-Mizu-Trace-ID: 2b4d5000a6ed5f77
X-Migadu-Flow: FLOW_OUT
From: Hangbin Liu <hangbin.liu@linux.dev>
Date: Tue, 20 Oct 2026 17:56:30 +0800
Subject: [PATCH b4] tests: pin scratch repos to master regardless of
 init.defaultBranch
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
Message-Id: <20261020-test_base_commit-v1-1-083fa909c424@kylinos.cn>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCMBQFr1Le2kASoqhXESlJ+tQvtJX8KELp3
 Y26nIGZBcoiVBy7BYUvUZmnBm7TId/idKWRoTG89TtnvTWVWvsUlX2ex1GqGfx2z+CyPYSIlj0
 KL/L+LU9IAee/02e6M9fvC+v6AR7BwL94AAAA
X-Change-ID: 20261020-test_base_commit-d258e41c094a
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Hangbin Liu <hangbin.liu@linux.dev>, 
 Hangbin Liu <liuhangbin@kylinos.cn>
X-Mailer: b4 0.16.0

From: Hangbin Liu <liuhangbin@kylinos.cn>

_init_repo() ran a plain "git init", so the scratch repo's initial
branch followed the developer's init.defaultBranch. On a machine
configured with init.defaultBranch=main (increasingly the norm), the
repos come up on main, and test_base_commit_in_remote_tree then fails
at its "git checkout master".

Pins -b master on the local side so the suite passes regardless of the
developer's default-branch configuration.

Assisted-by: LLM [analysis, codegen]
Fixes: 4ee47be995f2 ("ty: verify queued-thanks commits by ref reachability, not HTTP status")
Signed-off-by: Hangbin Liu <liuhangbin@kylinos.cn>
---
 src/tests/test_ty.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/src/tests/test_ty.py b/src/tests/test_ty.py
index 269ce021306f..2901f053f0f5 100644
--- a/src/tests/test_ty.py
+++ b/src/tests/test_ty.py
@@ -401,7 +401,9 @@ def test_get_check_repo_config_override(monkeypatch: pytest.MonkeyPatch) -> None
 
 
 def _init_repo(path: str) -> None:
-    ecode, out = b4.git_run_command(None, ['init', path])
+    # -b master: some tests check out "master" by name, and an
+    # init.defaultBranch of 'main' would leave no such branch to find.
+    ecode, out = b4.git_run_command(None, ['init', '-b', 'master', path])
     assert ecode == 0, out
     b4.git_set_config(path, 'user.name', 'Test')
     b4.git_set_config(path, 'user.email', 'test@example.com')

---
base-commit: 6be7c6139d7734d84afddf989fa2874935b6d85b
change-id: 20261020-test_base_commit-d258e41c094a

Best regards,
--  
Hangbin Liu <liuhangbin@kylinos.cn>

