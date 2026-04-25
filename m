Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EE83016EE
	for <tools@linux.kernel.org>; Sat, 25 Apr 2026 19:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777146601; cv=none; b=BVkWdJ9z3rVh0cq/sSfQSD2UefdXu4V4s+mdjpXY9Hs7nGW4QFCAKk/h8dMKVduI7iCU0vVPtKktzLW05ZgFck36H7SaG21w5C+liCgOIpG/YCibboAV6dYVgBEFmrhavUU5kURUuSyPXad8j49SWvGjpaD8JnUCKuY8ymvYZQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777146601; c=relaxed/simple;
	bh=ZI9YcmF7I21OCMO/jqIdBtuTVSvGp4WFEx35wXrjErk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBYJwG2F/apQjq2F+8ACAvPVZ5c+/n1OlaVN114XypnDK68R/GFjEBF0JO2G2RrXjWzH5kyAN0J0GiNOBf5dDum1ol/1eX+zsyeb2l3HLx2UKV9rMjumGzAm/xNCm39bmkJD3wYykK98LE1OfAkDMAFrwX4a4OxXVV+wOwwexlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxWKklzp; arc=none smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxWKklzp"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12c8cac037cso615661c88.3
        for <tools@linux.kernel.org>; Sat, 25 Apr 2026 12:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777146599; x=1777751399; darn=linux.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RzNGIetJL8WwqCiChfINqLfM+GYonsPPEJ8y4w/pPCU=;
        b=kxWKklzp1QBftM4AgP2bTFjOEJUXB7mww8hyaDX01tQDo8fS6dxKNBEwrTKYmabqyb
         uxLL2DH5EW2Ri5EF0Pei7nd+2q/x3Q1mvzCASClhzgHNtarmITiR4mnLY2JyI2sBTpnp
         btowvaDikEwa0hzMULyEsrDBQ+nz0+CUAWJeiKxOj5pyZqJZoUcGau0UdaOKs8lj6Rc+
         7fiUfsEO3b0PwiKcPMYb2wMjADr/z/cs4PsJgmuPdC7EDCjuCrkAzFe3m1/Sw6ib8CjU
         DTkkNeYRBZI97e3R5jj8veggd7QapCR1HACDl7Qs1PWK0dGp3vX27WrJ+ea0KiBz1Hlm
         1MuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146599; x=1777751399;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RzNGIetJL8WwqCiChfINqLfM+GYonsPPEJ8y4w/pPCU=;
        b=VA1KPsMHCafYZDSgSY9btn7OOdgz7VVBjfM3PYvp2OuR5zWd4cOfK9r8ZwIFNq2jrn
         u2NfSYbaNXaH7F6aaF/8I5/U31HH+lsCrzVcYFhsRwMihe5U5l60Sl3EjlMEnz6I0kUA
         hyNBUMt0feqAYXom2i6SptbMthGQoXAInI0bNXXiccJVRvEDawb01kouzVRcCu6lp5o/
         oVG42XpjFZeHNS0VQnZhztTyL8RYvaiO0v8gUcWMvdz+TtuMYc9/IP0VutjQy2ANMB+q
         3foNaQS2jFRq4vW7+e+A9RuK5mvrFZVjqcGOgfM7HkV9xgbmz3dH0Zu81Lm93wTsY5tA
         OciA==
X-Gm-Message-State: AOJu0YxwqXm/OFcx2TSlE0EZPsgfVKfeQ3WfR9sPPPuO0Jyg41I3AUbb
	PQXEHS9sRTnIUpxdtlYcGdouLFg00kZuClgKdKH5BZ6pdXSeqvQQczze71+wcw==
X-Gm-Gg: AeBDieuiE/qg/7EskUTW/ALDE0grTko8TTQ4IBZfyV7KlW8Q2EdVITNe95fvKHGWwFv
	J/uZpKoFiOTo6jn1rUHPnwmruFaOvgxLe5iJ58wly45Wc30S1KHLCzu/Wwg2mR7QlRU8TJmbKyZ
	b5AftUnKlTqU43fiFSq8ttpq7FhscIDRAqs0T6droGW812casg2Ws1EAmNz9ZOOYwDn4+E4J1bW
	KTcqK1HXezclmbsnT1zW3Pf5UY0XFr9TqsRbsi1veUVZxQcaR3Zk9oNbeFoPOrPDGqmDjtqzjop
	+asxUosHDPd4LVyy5JiM7ptmcVrxWQIlY3lygVIHqUFJWZQaQyo2YEMRpmABj7GJj5v3CGC0CzS
	dqvjor/fTRNST0NWrPNPFt8J5MtJbYLAjiBziIxfv/wLs3kymSmtul57seXJ8qL7tAzIlC+rVRX
	llr2dw90DdfsAqoFedsF5SRqdQoYp6XxABSsEOOkvPnOaDTIbipk2+x3790UpR+UlxwETmGRh5p
	0HeBjdjOzLtVmdc5qVXHxzn
X-Received: by 2002:a05:7022:397:b0:11a:2020:ac85 with SMTP id a92af1059eb24-12c73f94982mr7273528c88.4.1777146599381;
        Sat, 25 Apr 2026 12:49:59 -0700 (PDT)
Received: from localhost.localdomain (187.250.115.107.dsl.dyn.telnor.net. [187.250.115.107])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a20eb5sm48512078c88.14.2026.04.25.12.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:49:58 -0700 (PDT)
From: Adrian Neftali Sanchez <lutgaru@gmail.com>
To: tools@linux.kernel.org
Cc: konstantin@linuxfoundation.org,
	Adrian Neftali Sanchez <lutgaru@gmail.com>
Subject: [RFC PATCH 02/13] tests: use os.path.join/normpath for portable path assertions
Date: Sat, 25 Apr 2026 12:49:30 -0700
Message-ID: <20260425194943.1499-3-lutgaru@gmail.com>
X-Mailer: git-send-email 2.45.0.windows.1
In-Reply-To: <20260425194943.1499-1-lutgaru@gmail.com>
References: <20260425194943.1499-1-lutgaru@gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hardcoded forward-slash separators in path suffix checks fail on
Windows, where os.sep is a backslash.  Replace the literal string
comparisons with os.path.join and os.path.normpath so the assertions
hold on all platforms.

Signed-off-by: Adrian Neftali Sanchez <lutgaru@gmail.com>
---
 src/tests/test_review_tracking.py | 2 +-
 src/tests/test_three_way_merge.py | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tests/test_review_tracking.py b/src/tests/test_review_tracking.py
index 290c991..7d34951 100644
--- a/src/tests/test_review_tracking.py
+++ b/src/tests/test_review_tracking.py
@@ -23,7 +23,7 @@ class TestGetReviewDataDir:
         """Verify the review data directory is created."""
         reviewdir = review_tracking.get_review_data_dir()
         assert os.path.isdir(reviewdir)
-        assert reviewdir.endswith('b4/review')
+        assert reviewdir.endswith(os.path.join('b4', 'review'))
 
 
 class TestDbOperations:
diff --git a/src/tests/test_three_way_merge.py b/src/tests/test_three_way_merge.py
index 2b4391e..9982075 100644
--- a/src/tests/test_three_way_merge.py
+++ b/src/tests/test_three_way_merge.py
@@ -556,7 +556,7 @@ class TestLoadShazamState:
                 'origin': 'https://example.com',
                 'merge_flags': '--signoff',
             }
-            assert sf == state_file
+            assert os.path.normpath(sf) == os.path.normpath(state_file)
         finally:
             os.unlink(state_file)
             os.rmdir(patches_dir)
-- 
2.45.0.windows.1

