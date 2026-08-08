Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC7F1A275
	for <tools@linux.kernel.org>; Sat,  8 Aug 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786207647; cv=pass; b=nBLnh96ERnxkHYWjFVnXVn6gZqzX2K2OVnsx/I40jdM+I1Lnau0qVjbENdAi3Dd0MHCDdHJ1GypjT82ugwi/RsvyHZHtXGIGwvviqhYmdmS/M/pBM9koZ7lRiAXWARSJ8kvSddTtqeHMEegy3IvGVL8rA9Pzi4aD2VnxiJUoRkk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786207647; c=relaxed/simple;
	bh=6D977IrgVDBkcgivpprGbxNtF3MVz9YQy1S0nSIzqMY=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XIhdxeLsAYysdVEnl8hRL7o/bLnynl/D4ZHBKP0EEc9dHxmM/hEuggVL55PA4qABWu6Jxffi6j2m2r9z8HLt67mI4hwzNBwA6omOc4SI9ejxGZOszujVT+ELtazXXgdTIHzSufnmubJdBLShIvYHEPAQ+GTKpFB2mFFHV2I3NaY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qgq0qcHu; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qgq0qcHu"
Received: by smtp.kernel.org (Postfix)
	id D48461F00A3A; Sat,  8 Aug 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1786207645;
	b=tES4xOO1Q0wocYiov2E05f1R/5MCCQEwTH+mJc0Gjc75msV911BveCLOEie3wViDWqyf
	 BL3JvcTmB+8mC/tH1jDQPDBEoynK7tPeenfjFbGdqeD/9y+sxVy7whYZ9HxVGVhCEeJho
	 HBNmgnSNam2RFUbyc6PK8DUo0UMNtDaB1ujSY+BZ2iqHJNm+oZh5q3H4oio+NPbtM7wBr
	 nj1uuuf5cAZ1qEf8dO7SnbjAdgqpIm8MShseyfIcsyDwhdWJvz4GkuROXWBT42b5VTQL/
	 CUnlDmt/X7Ki5EI7CdHFHY6Tus/DqCyeNPYzXGSW+k0rQllNDot2Fy9H4FAUirHKeSg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1786207645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=Vh9K3o1O//S79oN/Iv7U9b+olry/kvcHHJUy/1tiIE8=;
	b=Ew+zM/9zhQN4R9hT+M4YiSp/nXQxRx/1cG76hD6KT0OcUwxnImeYX6NXiQx05keyQKUA
	 skFiiLovaXoyt4LYXsB4R1vfocMPNqO1XvncmHGeUS6sXgfrc4dtSp0xLhxlfkXHdjsvE
	 +xg6k9U4OcyuTBVhBbPMOegRADHi4rs0+oU2akUibmQMUNew3udLCdQb4pgAxJ8DnNn18
	 igZsSBI0GmrahnWE4gNAyW28MQwjBWtYMjty1SZetfxvVdhLicv51YuGxGZ8Kg6Skqhh7
	 D2TAQiHqGctLiJrxZG0xkyhxqeX+Sliy7TTGqa0Bur0WLw5LJu+ZFiFqGCgwpqz9zVg==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qgq0qcHu;
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4CD0C1F000E9
	for <tools@kernel.org>; Sat,  8 Aug 2026 16:47:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=qgq0qcHu
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 4CD0C1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49561facb1dso3696595e9.3
        for <tools@kernel.org>; Sat, 08 Aug 2026 09:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786207643; x=1786812443; darn=kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vh9K3o1O//S79oN/Iv7U9b+olry/kvcHHJUy/1tiIE8=;
        b=qgq0qcHu3idduQTXmwm9XoofZvJfH9A/2ef09VFVDMLUN8rbYLPSs1BVnI4sJk6s+D
         dTUJIW9gSAP15T9x13qsIUceZIdM0Q2fQt6MIVShIhBzBX1bHCrrfPvu6KC/VqDtBy+p
         PEXcme+iuzOkf+qCDoZf3QZ59Des9/2z2bBT011m+0Cj7FosmnwKSda3trKwH3ZQfbYy
         Hx7JVBRFjDUFKjeoz5oqY/eG9twihNaSP/+Hjg5vAZ5/Wi7YyqnVTA2/DXgfN085d7A7
         1iZYTH2l6FQT3TVTPPvaCEGDcIKKZjtjCymQoyNxOPuA8gXKar39EkuSMt+rQdQ7y6oR
         xL7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786207643; x=1786812443;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vh9K3o1O//S79oN/Iv7U9b+olry/kvcHHJUy/1tiIE8=;
        b=P63FnWbu5G1J5e2TaO4n9AI0+bDIMnhWJUPZeFc9F2rR0Kim+b4dxCA4lLSlQ9LDRC
         23LsnBPRrhjvrq+J4IfW5aPNuqhpkfWXeTr4B0TuXk3ZXX9uOennjON41Hnw/VVPHcih
         VD6x8ud0SS03pniG3zvQ0aa2trBVp614qpEoqQLCkNc+VF/EhPSXZzhAYrn0AJv8IOMc
         rYLuDqST1bmmlnXJzYRq4wt3BcsQyCpb7G8Qq3s/5dFQUNDgvUF9p2JKSKyr6MlKs5QL
         kfjQsjA/hyrzTHtkhjupoV/gnXrN1lJnTSyGQ1yQK+c4GPKDC+FrXXB5i3FdgqLmVcRI
         LACg==
X-Gm-Message-State: AOJu0YyrSrOJQQesjH++8v/RCKN7IDD0jCmyZCok6XZAIEdCJsJqjY/n
	qd0KP0DwLz55saGVR8N8vNFh3waS8YHjB+N2KXa66jBoU/YeL6XuzgTeMnRrK/r9RAvShP9pvS5
	pi3Q36I+dCjsYL+QItWe/pre/YQkHGnOn3HsS4sLkMWaPCZKu3xX5pe2YRoVEt69c+RQaLFX6l2
	rzFzwzNZ3ndohn9aFr2L+OjaXXo57hw1HC/cF6z1Y=
X-Received: from wmgf15.prod.google.com ([2002:a05:600c:154f:b0:494:133:ddd3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f86:b0:495:4d00:2fda with SMTP id 5b1f17b1804b1-4994e72f7c1mr403987065e9.2.1786207643269;
 Sat, 08 Aug 2026 09:47:23 -0700 (PDT)
Date: Sat,  8 Aug 2026 16:47:08 +0000
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.654.g21b8a5bc05-goog
Message-ID: <20260808164708.1084648-1-smostafa@google.com>
Subject: [PATCH b4] b4: Ignore Signed-off-by trailers in follow-up replies
From: Mostafa Saleh <smostafa@google.com>
To: tools@kernel.org
Cc: Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

When someone replies to a patch thread, sometimes they include a
Signed-off-by trailer (for example, when providing inline diffs or
snippets in a reply). Currently, b4 am/shazam collect these tags
from replies and append them to the main patch's trailers.

I am not aware of any use case when collecting the Signed-off-by
is needed, so drop it in this case.

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
I hit this when using:
b4 shazam -v1 https://lore.kernel.org/all/20260806150105.4010701-1-smostafa@google.com/

It collected the tag from Marc's patch in my patch as in:
https://lore.kernel.org/all/20260808085824.732659-4-smostafa@google.com/
Which is wrong.
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index a52b001..fd33111 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1857,6 +1857,7 @@ class LoreMessage:
                     'base-commit',
                     'change-id',
                     'message-id',
+                    'signed-off-by',
                 }
                 if trailer.lname not in badtrailers:
                     trailer.lmsg = self
-- 
2.55.0.654.g21b8a5bc05-goog

