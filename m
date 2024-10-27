Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D5E1E50B
	for <tools@linux.kernel.org>; Sun, 27 Oct 2024 15:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730043242; cv=none; b=SC1BMQ8WeTBH3aDW9vLRBopdASqyPJ8VgsJXFtnfvajlRnJglQzlhRMqNbcruon1XzhH/TbeKMioVlidsYnJ2PRyaMKc1htpNYxe5UP0A3t65W2o0sqwin2jBoNEUuFeBFwfpq2V7xl2l51JbvJ8OzXSB5zoIu0w+TSp7jBbO3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730043242; c=relaxed/simple;
	bh=bl0MQPpbsfgbfqmd1BPBHQsu6XfUgO+CUPuk0F2si2k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CiPQZpQfpFwqtunL1sKUQFazvUIoPOVeNb7Si3Yv3+KCKaMnQGbufUKGqrSGelY6dgcq4H8vlm5FW3kQJ5NsqVXQmLawa4gqK34h858i0hgw2/Rh81FfO4SqA4PyUtxOUVx5/+Wwl49UqDLP1zBYDgrduKtUiC2G86CXXkShxP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ORo3Deav; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ORo3Deav"
Received: by smtp.kernel.org (Postfix)
	id 80F35C4CEC7; Sun, 27 Oct 2024 15:34:01 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 943BEC4CEC3
	for <tools@kernel.org>; Sun, 27 Oct 2024 15:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 943BEC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-83abe7fc77eso138878539f.0
        for <tools@kernel.org>; Sun, 27 Oct 2024 08:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730043240; x=1730648040; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=feNtiNDrvPASm9AMoQZM6ZYoF2Qw3Q8IJGxUNfSfC08=;
        b=ORo3DeavlKUbYbASJi9r5HIrcU9CErfuK1OfRCK/aoWKK8fdWMrqO3CGdsrfrPn7ad
         DmKmMqi6jn9CHYhb5FjLataYSAg0PDuCtkRz6/ecHE5PqcNG3DVb9K7WMGsBU4BTp1Q5
         ua7OZNZowvrpbQaLOS//np1frG0lw5PSLZ0FZ4/Y18+mWHaGBjKnJM6kRzsOn0ev1Cye
         UB0a5/S/DowiN6ws0IwDJvcn6ZixH8yaNfQNYgJ+iRa4caakMC+7eUBBO0Od+v0EZLvB
         41mUWhqlFen1bEx4c/vC5NCkr+pFoHvRbjwRUjxpJWTQxXukTcqUfuSN/Dl4M9aUN3li
         U3ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730043240; x=1730648040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=feNtiNDrvPASm9AMoQZM6ZYoF2Qw3Q8IJGxUNfSfC08=;
        b=CNZNDcCqmRtMSiHcotYuPwoLvQOxbqxw+z9Jh9dHMRlXj3FHGRDp9YCUr5k/nvpDE6
         0kulwkEiH4hnM00nXiz2Hqft0I8PUuPS931f1fvMMvWimLL3mjYrr0M5P2MCTOFitOV0
         FKkCBCTgyorh7QOzEqEkhF39ENw3qAuEnOB9YYd1UJKaO6f9yf+ALcE6//CuyOtiX6tU
         3xKFrAAbZXv3amaA8j7QYS68uJn7mJW+xYXva8WQpc/+obaNW0B13ZkzqYX3lse7+XcD
         pFe0Wu4s+AIIMxFadCo+vrsnIPZO/qzatMuyVVYCU3V4B87dlvuru6Yv9nR4lh1xnAKs
         L5Jw==
X-Gm-Message-State: AOJu0YyzztDpka5MsXc/2whz2YbghRehiLW5Wz3DPIOeGVInA0ITYnl6
	z+zVYxjTtZCZlWHvMJp/4A2Wwk4CE/mLk0o6cZePCRkaQXrxEPGBt3kBsRwC
X-Google-Smtp-Source: AGHT+IEtSju0b2FsMOFANS2SH8vcE+le7Wchdk8vzeDnbgMv3uYQ7DjSGCjPKRr/AfflnJmvwj+tyQ==
X-Received: by 2002:a05:6602:6c0e:b0:835:4cb5:4fa7 with SMTP id ca18e2360f4ac-83b1c4b4ff6mr403997039f.12.1730043239572;
        Sun, 27 Oct 2024 08:33:59 -0700 (PDT)
Received: from localhost (207-191-210-45.dhcp.imoncommunications.net. [207.191.210.45])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4dc727512afsm1210782173.90.2024.10.27.08.33.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 08:33:59 -0700 (PDT)
From: Brandon Maier <brandon.maier@gmail.com>
Date: Sun, 27 Oct 2024 10:33:54 -0500
Subject: [PATCH b4 2/6] src/tests: fix trailer test hiding parser errors
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241027-trailer-special-chars-v1-2-1bd180dba425@gmail.com>
References: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
In-Reply-To: <20241027-trailer-special-chars-v1-0-1bd180dba425@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Brandon Maier <brandon.maier@gmail.com>
X-Mailer: b4 0.15-dev

The trailer parsing test compares the values of the b4.LoreTrailer
object created from the test input against a b4.LoreTrailer object
created from our expected test input.

This means if there is an error in how b4.LoreTrailer parses input, it
won't be detected. This was discovered from a reported bug with parsing
email trailers with embedded ','.

Bug: https://github.com/mricon/b4/issues/50
---
 src/tests/test___init__.py | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/src/tests/test___init__.py b/src/tests/test___init__.py
index dbc92c7e8352728c2f2a951f7b9b1496ccbaf2c5..7fe43b0158460f06d0a2b52d2689d26e7ef7f840 100644
--- a/src/tests/test___init__.py
+++ b/src/tests/test___init__.py
@@ -57,7 +57,7 @@ def test_save_git_am_mbox(sampledir, tmp_path, source, regex, flags, ismbox):
 
 @pytest.mark.parametrize('source,expected', [
     ('trailers-test-simple',
-     [('person', 'Reviewed-By', 'Bogus Bupkes <bogus@example.com>', None),
+     [('person', 'Reviewed-by', 'Bogus Bupkes <bogus@example.com>', None),
       ('utility', 'Fixes', 'abcdef01234567890', None),
       ('utility', 'Link', 'https://msgid.link/some@msgid.here', None),
       ]),
@@ -77,10 +77,14 @@ def test_parse_trailers(sampledir, source, expected):
         assert len(expected) == len(trs)
         for tr in trs:
             mytype, myname, myvalue, myextinfo = expected.pop(0)
+            assert tr.name == myname
+            assert tr.value == myvalue
+            assert tr.extinfo == myextinfo
+            assert tr.type == mytype
+
             mytr = b4.LoreTrailer(name=myname, value=myvalue, extinfo=myextinfo)
             assert tr == mytr
             assert tr.extinfo == mytr.extinfo
-            assert tr.type == mytype
 
 
 @pytest.mark.parametrize('source,serargs,amargs,reference,b4cfg', [

-- 
2.47.0

