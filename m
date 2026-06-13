Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD03DB331
	for <tools@linux.kernel.org>; Sat, 13 Jun 2026 05:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781328685; cv=pass; b=c1z8MKQu9b0KQ/laPgdG8d3OruxKeK0dN1c2jGDd4Fmj5nJ+HYqwQhT3U9DJuf7vpKKGDW7QIQwNLf1UM21llKU/kHWa4rUtXVwFb5Qkt7GirspKRckWa1NbHLk144NgcSyMshxVyYhTb5ytl8NgnBSr99Z5NzuZ1ya5AwOrDFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781328685; c=relaxed/simple;
	bh=a+VAWP0rTZJW+YQXoh+GFRl/5OOqPdb0PMrs5VLGWIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X99hMCKAYBoElg7xSH+uUj1LFVukPbibqefCps1z/Dc/uif+R4fLeXfAIWz69N0I6Ybt99ZGZFdhaoJY1VQmF8n3C/fg5PU21AQDWONSTc/lw+BP3wx25ACcQR7fbnfGgk7nyMk2m7xf+T7DBPc6TrVWsvl5LzVkLp2sr9VfXPk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqA3V7jV; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqA3V7jV"
Received: by smtp.kernel.org (Postfix)
	id D50481F00A3A; Sat, 13 Jun 2026 05:31:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1781328683;
	b=PwgjtK2/fM3XRxVaqIXTPJ9JEYZV3NtTyD43rj0oTWYXEWKzPEDIPSJX7pwuY/y94Yur
	 0buHiLbG4n9XvT6Jd2wFDySQOX5E4rdW73W78tWX7gsfmG6U6AwrNesCehlI4nRifGTgG
	 Uon+w4WRbYMfU574OmJCjPogeZj1UZc6AL4oZ7IVGbpu2dW1vDeDtmJFKskVO5LK32oPD
	 +7i5vDeR0QUoARGMhpFavSFjibutu/3jg7PMrkJt1qJKYyqGU2vmxX4DkmYxG8ic/7GLQ
	 AkQQo0XnaTb4QL1kbMhxUhv4oPVOHk10yUCEWbpzxntE1MVE3MdwTFvMXzG7Yp3Huww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1781328683;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=uXEMam8qzaTXoVFLzMmLeW5h8YQs5++z+vBnh5ACJ8M=;
	b=FA/fdtN1bv8POSkdqv0qDsp9htetDnHwxT6ZRrgHpreQkbieGLCAEErMypgEfDh4Al9M
	 MuUnqjSc8BcPCO3NvNcshYNAnHO3KgiI+SeQpRfKx+P23p8WNkSBaU+6PER6QddvZWTAC
	 QPfZPJlxVXmx/cNhWkTPFyUXIFbR8JuSI8HK/YE1ScLRdG9IKXso34FmMDTFUHapi1FYs
	 noj01lWCYwLgv9E3iqOAzVaIJTYPJlhcH95R8T7kMfZDlfMi/xo8oT/ZbhSmaRhXw58W9
	 loV0OsJB24t/C9Ra6uFKDEMYqXHa0L+daf981UCxWAedA05RILxwnP5gGosH01peiCw==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dqA3V7jV;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4C1B01F000E9
	for <tools@kernel.org>; Sat, 13 Jun 2026 05:31:23 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dqA3V7jV
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4C1B01F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-30749947917so5144809eec.1
        for <tools@kernel.org>; Fri, 12 Jun 2026 22:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781328682; x=1781933482; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXEMam8qzaTXoVFLzMmLeW5h8YQs5++z+vBnh5ACJ8M=;
        b=dqA3V7jVlXc46tJw5cx7csdALJk+Re+aecgBxfl4RApp1NE1JcxSlKdv3ov3rkm2Bd
         p172F9OKktE5qyaSBE766fRizs2fpgitj9mNcYZWldhgqa5FN1PJaxzP6Rsxls7t5UEE
         Hl53N5+bssjWAoUoYvG/xW3xokQyoJ3OQdWnN6Ui9dg0W3ri7rsI2rGnLg0imYe1FsAd
         WkQOKfgDF6ZTGSRhdyzotBeJdxu0e6rsRpuEYBsAo7ieSlcm32aLWa62m5L+3NdrqHbU
         bnG/vk/dEa8Eo6xfLLC82jXd4Q5B74N+74G9YjcS682BxpI4EiyZlHWQbq20Tdawb7fQ
         cAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781328682; x=1781933482;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXEMam8qzaTXoVFLzMmLeW5h8YQs5++z+vBnh5ACJ8M=;
        b=cfi3rqUfpbZE3Fod39oOBxtcAFtOKTzNU4cD6FUznzzGSzPQGdA7IJgZn8xRDpLl/N
         Tg6tfXVAMk0f5V9HVihxmdWrxwaFHqrK8RTe5wWU0Ws+fqLxSQ+qqVRwJWKrLPwfh29G
         QdSC3nxRYdl5zmyRJn5jEGnQGueRmbPioICRo07iBc4rnkZRag5SKiyholoJthl8l/gY
         QM5bU4EqLN7UDZZqJW+4ku0d18dtNe294XiqEH39dP/YcbUxhQqVFtLxPiS2q+FTkMDF
         OVo9HjOJqJPTGvCkMLDtnFs1eZ2E8KHaoWqI4x6UsW/Bm1hNFYrFeopSzSMIVOi/Q5N6
         026g==
X-Gm-Message-State: AOJu0Yw+aGRFHSKIFODfWioXpd4CHnVvRPeHGYHyVBO/UKgAtP1s4hYK
	Hs/TgR5uXortTRCCVWVlw1lDxeZhMGl364b1dPYxKHy8ZJ9Wta+QAnvf4ohqiius
X-Gm-Gg: Acq92OGFYdGo8luch0C1BBWq9esZIzP3WVsN4ZuHe1RzEyK77XNjs7gwqfqEB0lPmC8
	fhT9CMn1MlSrmGXawsw42Rc9cMmbPp+nW9MaTseTApi7ts3SWdLNkPa7kiRsx41SvsJEp0wIcxh
	J6OAJb/YV2HfCGGfx6QTUr0MB7+nJw0Mv8Gmm+qbgAQdWAwHfMhehoytaLCFd9NS/LPdkNtF5VW
	eJsn7lrXSOOKkji4DXIgFU+px4fUtN5Mxd9OzdDT3s7cEhqFaoVbQ7ECVk+L3ipsTFU9hmqw5ia
	howkoI6twFu9s8r7Hwj7c7Pv7Q0KY+wbAgH8rBTOzQGLU7hMbi9s12o8hm9nsX4w3wjxPHFWx9e
	2rcVJAex3XvKhngnW9DkX8JJibL1/IPJjC6fRedXWV+gUVuh28IXhGNCmuuiur3cpJCiMt/aglr
	9ofmp2VXAmjgrVeEpwWi5JR4F+KrCaO4s8SS4q7NphYTfmFoCjiZrh6j3DXiGtLpks8CxsRraO8
	Q==
X-Received: by 2002:a05:7300:3723:b0:2ed:e15:c922 with SMTP id 5a478bee46e88-3094197a175mr1350537eec.30.1781328681942;
        Fri, 12 Jun 2026 22:31:21 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0849sm7098209eec.7.2026.06.12.22.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 22:31:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Sat, 13 Jun 2026 02:30:03 -0300
Subject: [PATCH b4 v2] ez: avoid duplicate signatures on resend
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260613-resend-signature-fix-v2-1-ddd560f810bc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22NwQ6CMBBEf4Xs2TWwQEFP/ofxUGALNdKaLRATw
 r9b9ODFwxxmMjNvhcBiOcA5WUF4scF6Fw0dEmgH7XpG20UPlJJKVZajcGDXYbC909MsjMa+kCi
 vq6Iqa0UK4vQpHOPP7RWaAm7fLMzNndtp/9tbRvyI0yCsf4iSyv+IJcMM05PporTJC3PpR20fx
 9aPsG1vY9F2F8gAAAA=
X-Change-ID: 20260613-resend-signature-fix-223874758626
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3729;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=a+VAWP0rTZJW+YQXoh+GFRl/5OOqPdb0PMrs5VLGWIk=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFk6r5VlVPvnXlv3UzZaWc80d32g/qdD7Ad+vDtock+36
 Rbjrf8bO0pZGMS4GGTFFFlWJy2y3NP14Gp93AoPmDmsTCBDGLg4BWAiB3MYGf4nFZ+Tysz1fL/D
 mMlg6Y47XH+Svp8t2xLxUSlW6PkTd1OGP/whYSodbztYO2bVxczIO1eWcj1/YuEyh3RZ45Mn2f7
 8ZQMA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

'b4 send --resend' rebuilds messages from the historical sent tag and
appends the current email signature to the cover text. If the stored
cover already ends in a canonical signature block, the regenerated
message carries two footer blocks.

Strip an existing trailing canonical signature before adding the current
one. Reuse the helper when preparing sent tags so reroll and resend handle
the delimiter consistently.

Link: https://lore.kernel.org/all/20260511-alsa-hda-cs35l41-fw-work-teardown-v1-1-1184e9bc4f25@gmail.com/
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
Changes in v2:
- Only recognize the canonical email signature delimiter '-- '.
- Preserve bare '--' lines in cover letter content.
- Add a no-signature regression test.
- Link to v1: https://patch.msgid.link/20260525-resend-signature-fix-v1-1-09fd09faf34f@gmail.com
---
base-commit: 474350a3035537184556061872e9e905b47774ca
---
 src/b4/ez.py         | 15 +++++++++++----
 src/tests/test_ez.py | 26 ++++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index fa904b1..2378c93 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1735,6 +1735,15 @@ def get_cover_subject_body(cover: str) -> Tuple[b4.LoreSubject, str]:
     return lsubject, cbody
 
 
+def strip_cover_signature(cbody: str) -> str:
+    body = cbody.replace('\r', '').rstrip('\n')
+    sigpos = body.rfind('\n-- \n')
+    if sigpos >= 0:
+        return body[:sigpos].rstrip('\n')
+
+    return body
+
+
 def rethread(patches: List[Tuple[str, EmailMessage]]) -> None:
     refto = patches[0][1].get('message-id')
     if refto is not None:
@@ -1993,7 +2002,7 @@ def get_sent_tag_as_patches(
     cover, base_commit, change_id = get_base_changeid_from_tag(tagname)
 
     csubject, cbody = get_cover_subject_body(cover)
-    cbody = cbody.strip() + '\n-- \n' + b4.get_email_signature()
+    cbody = strip_cover_signature(cbody) + '\n-- \n' + b4.get_email_signature()
     prefixes = ['RESEND'] + csubject.get_extra_prefixes(exclude=['RESEND'])
     msgid_tpt = make_msgid_tpt(change_id, revision)
     seriests = int(time.time())
@@ -2661,9 +2670,7 @@ def reroll(
     mybranch: str, tag_msg: str, msgid: str, tagprefix: str = SENT_TAG_PREFIX
 ) -> None:
     # Remove signature
-    chunks = tag_msg.rsplit('\n-- \n')
-    if len(chunks) > 1:
-        tag_msg = chunks[0] + '\n'
+    tag_msg = strip_cover_signature(tag_msg) + '\n'
 
     cover, tracking = load_cover(strip_comments=True)
     revision = tracking['series']['revision']
diff --git a/src/tests/test_ez.py b/src/tests/test_ez.py
index 3d05ef9..9be2064 100644
--- a/src/tests/test_ez.py
+++ b/src/tests/test_ez.py
@@ -408,3 +408,29 @@ def test_store_cover_preserves_series_notes(prepdir_commit: str) -> None:
     ecode, backup_oid = b4.git_run_command(None, ['rev-parse', f'refs/original/{cb}'])
     assert ecode == 0
     assert backup_oid.strip() == pre_head
+
+
+def test_strip_cover_signature() -> None:
+    cbody = (
+        'Cover text.\n\n'
+        '---\n'
+        'base-commit: abc123\n'
+        'change-id: 20260101-test-change-id\n\n'
+        'Best regards,\n'
+        '-- \n'
+        'Test User <test@example.com>\n'
+    )
+
+    assert b4.ez.strip_cover_signature(cbody) == (
+        'Cover text.\n\n'
+        '---\n'
+        'base-commit: abc123\n'
+        'change-id: 20260101-test-change-id\n\n'
+        'Best regards,'
+    )
+
+
+def test_strip_cover_signature_without_signature() -> None:
+    cbody = 'Cover text.\n\n--\n\nMore cover text.\n'
+
+    assert b4.ez.strip_cover_signature(cbody) == cbody.rstrip('\n')



