Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C8F39A075
	for <tools@linux.kernel.org>; Mon, 13 Apr 2026 22:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776118114; cv=none; b=WDicEtvEq302Whu7st/eLtZfee1spLP4C+NXQcutzbxwX6I1IE5TxnfYSWuvJEZIZkUTHn4XiC2B4TydVe4doWDkLNEeWiUBwPOXkt7JQVGixRH0zjRbPRo8kFBdK5vogI08rdpwqn+JnvBX2qataO1S2UtlilkUajS5RG0qsDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776118114; c=relaxed/simple;
	bh=3ywxRA3QVis+3J0Wtq89PIX/RjGT9IDb1vDzq8U/ZEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=umi3Mm+/THLkyk+L3ZOhjg7SWD8Q57i+z04Ao752nJ8DXfsq5aJvoVyOFiEoxILoDHCQ8Fec4Pkh0g49FGHufam7AjlaInfQaHbEnin5h6kNlip6M2SoLgMzeNLmJk7o+jsFrkM9UMvi15l6lnWelrKqI4qSxPprCzSiQdE3Xps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XnJHP/Uk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XnJHP/Uk"
Received: by smtp.kernel.org (Postfix)
	id 36E6AC2BCB7; Mon, 13 Apr 2026 22:08:34 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EC2EDC2BCB5
	for <tools@kernel.org>; Mon, 13 Apr 2026 22:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EC2EDC2BCB5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-8dfb9139008so176391885a.1
        for <tools@kernel.org>; Mon, 13 Apr 2026 15:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776118111; x=1776722911; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwPG2M50z9GIRNMSBCcdA8NdqqoB4hHJ4jdyyFFNO/o=;
        b=XnJHP/Uk2cNliWccBOukGlPEs/TM01Yg3weh2tMjPhNsMzJb3hoUInqyXJCWaWomS+
         4kaOsL7GFu94IVX84Hsc5YHf1vPaeAeGrH6Ax3nIznYrgBx36Cw5c/twuC1jfxHisL/d
         zhsEnryeivY8vzcoXlGexFetAc9YnOoruvwry2YZX4dJyHVpgBCYBP4ueFK+65YYb2xe
         OblC6LuVSb68da/mLkFGy+nTlzz29cAMMFau4Lbki9lTXR1G9pq3ySMiGG7ZqqQ7xuGC
         Yw1wcC4TO9vXBK0QfX2PLE15EVbCVXzrSUDbtodJZ1/4osBJZ0hpTR/KxEX//xDbmFSI
         QuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776118111; x=1776722911;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qwPG2M50z9GIRNMSBCcdA8NdqqoB4hHJ4jdyyFFNO/o=;
        b=kin8pHKaGLoUKW3tBqr14sxwMnx9bS2CB7J4pblT/K+ez1mhn4AWOsv9MNiRuFBFSf
         03sht1wIzS1Akow46SNFtL8Oa5kdY1G0mAOJ2SU4m+RrrlJqI4JBm8QTQ+wQd2Eby+Lv
         NYMVCVr+MS8ASDopzgX8yjlSgPwfboTkv1nAI1G4WhXEJexEOD6P2T19wZnv9dBKOVN0
         ozPJGNE1k+o8xXPqf69ZsM080RSTR1+H0Tl42PCrC8r6+i3X1cPqWVT0Hw3yBTnYxYWZ
         Qdbt/VOy7cKvggnKsmLg7wEkS3jNrRgrKZZ1elOc7Sk8UVK8jEmRtckKCSK4FEzyxBTi
         CMPQ==
X-Gm-Message-State: AOJu0YzBJrrqDQ93DU2sZnWMDI6HB+e/BgE1jczQ5NzfatQMZi7ziDUm
	3ro17lHUovc2e9wa3bepZahwxHaa8lhjPPh9HJlYaRHcPZXIeDbT/ByJ
X-Gm-Gg: AeBDietKDEN1HGs4WX9cwstRxzKIfOUxCKxgxGFNKIdKwJfJyKOBPBQhpHJCz4WOAfR
	/BLHvBauYTcwRXJdwMXm24V6EVNtgEcd4qpyJgLmsyqN99FZbMsYOEiIqImXNa5hnPQoqbL8ATp
	lGefL9zo27fmOLDFiX3vNxFbsNF1BUeNAfSzV1inqAPCoUdV8m3+Pu+WWIwhuL8He15+oG2Sgn4
	94H1ANSrg0K5PsFh8/iqJWa9ybcwjLoVOQM4XLorgVNf70PAteLGL9hWRMRd7t93/wOFi6DwAXu
	NsWFxzC61xqrrz9SNhQZbc3r4EeLQO5aeYKNTp/OWTrhFO5rgNuFK/PHl4gHp1C1EWEA3tFfAPO
	HeTa/Wzr5/MOTF/Uf9GAEnwqTAn5nbja4KaXxuawBeksAWoLLQXQZhouaZS0/qY5cqyKr8xJSs8
	8x3KAgyY0fEZI9LnUjBEMLYW+JxHQNGg6+K3HH9aUondOuHvccc0YmtfglXEYcnL4l72ZqTql39
	oSu+2aWaowht7gnsckDiNeIV2C9J5BeVT5IjPW5dXK9Kbw/oSLVJwZIoX1pBPV4lw9bzt3mDRsO
	mknQVIdhizwq3QDD0L/Z4+EsWr705bOPhTCe2YjvC2M2TtSf0uT16WanbIQLvan+
X-Received: by 2002:a05:620a:4082:b0:8dc:17e2:79de with SMTP id af79cd13be357-8ddcf7ba53bmr2154762685a.41.1776118110644;
        Mon, 13 Apr 2026 15:08:30 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([2600:4808:6353:5c00:c007:ed8:60aa:a884])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8ddb8d6e387sm907506185a.30.2026.04.13.15.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 15:08:30 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Mon, 13 Apr 2026 18:08:22 -0400
Subject: [PATCH v2 08/14] Drop redundant read-only property test
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-harden-type-checking-v2-8-1ba6056288d9@gmail.com>
References: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
In-Reply-To: <20260413-harden-type-checking-v2-0-1ba6056288d9@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1776118098; l=958;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=3ywxRA3QVis+3J0Wtq89PIX/RjGT9IDb1vDzq8U/ZEA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QM9cyv5QMqVQE0PCbqTYblQ4uPwbR1rlRLe9qLH0jxbntMEnvVYmyWvxNRSfe+YkQsSTeqK5r15
 trhRG0H9Y9wE=
X-Developer-Key: i=tamird@gmail.com; a=openssh;
 fpr=SHA256:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

Remove the user_agent_plus assignment test. It's not clear to me what
the point of this test is, and doing this already produces type checking
errors.

Signed-off-by: Tamir Duberstein <tamird@gmail.com>
---
 tests/test_node.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/tests/test_node.py b/tests/test_node.py
index f4a3495..4abb4f4 100644
--- a/tests/test_node.py
+++ b/tests/test_node.py
@@ -1924,12 +1924,6 @@ class TestUserAgentPlusProperty:
 
         assert node.user_agent_plus == 'my-tracking-uuid'
 
-    def test_read_only(self) -> None:
-        """Property has no setter — assignment raises AttributeError."""
-        node = LoreNode()
-        with pytest.raises(AttributeError):
-            node.user_agent_plus = 'nope'  # type: ignore[misc]  # ty:ignore[invalid-assignment]
-
 
 # =====================================================================
 # Public API: origins property

-- 
2.53.0

