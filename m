Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2E303DD519
	for <tools@linux.kernel.org>; Fri, 10 Apr 2026 22:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775860685; cv=none; b=ew+tpHFrlBoaItnma7sXMXOJniqcoHJeCQ+2SznnufqG78hZXfr2W+Yl08f2CJW4PK8BkjzOV6ZxUvHackJ8qt6jPQYyJ2QKmFcDkiUZfYpvqg0bpTaoRaN3vp6s3kD9q6vEsysza/mKeZ/glaJkv2UcKXPOh/d3o7aX4SDZvNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775860685; c=relaxed/simple;
	bh=3ywxRA3QVis+3J0Wtq89PIX/RjGT9IDb1vDzq8U/ZEA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T10nSmbPJ/lYZWt9iccAVt+43QHcOYAa4tOW0xUTkmtgjyYGG0pZU+7/XmAmxfygrQfhxavDkj9JlW5wODcWK4vPkUqTGzYTi+JG8HrHUl2s/uR6ifYUOxBlhYSyEIX8GwVdzmJWmSjZPiTx7BHGLep1D9BBx0ammQTj64J9lOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxjPGqBV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxjPGqBV"
Received: by smtp.kernel.org (Postfix)
	id B51A3C19424; Fri, 10 Apr 2026 22:38:05 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DB439C2BC87
	for <tools@kernel.org>; Fri, 10 Apr 2026 22:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org DB439C2BC87
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-50d8e11b948so25823551cf.3
        for <tools@kernel.org>; Fri, 10 Apr 2026 15:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775860684; x=1776465484; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qwPG2M50z9GIRNMSBCcdA8NdqqoB4hHJ4jdyyFFNO/o=;
        b=cxjPGqBVsSw6DRq+UDuv6dCRu9YPpr4Jr3dREsFfF82/sC3aN74oV+2/GmZTnhgKRe
         ZQFeMNN/41KM41UdEZJOQI9owsKmkehgUo8p3hxfMAOgRz8kfx5lA8eGierN5SyuFPsV
         WWL5NIv+sD4EXyfLZauFw1Op7d3ZOIipQzysU3QYOoGUkzfRqt4zniSJlX/tQwmfzeJm
         oDfhLuAXZwStj37xWurcV8IcEvh25BgW74IPTUQ+Hsg779NVIxUzRnlgTmaXDD1P4hgl
         oMvXnQJ7SUFKDnAxLsAxaCCnVp0l2LmNgxP8N3ICpwpNitUrhkYprkJJaokNXEZNjw+z
         qnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775860684; x=1776465484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qwPG2M50z9GIRNMSBCcdA8NdqqoB4hHJ4jdyyFFNO/o=;
        b=YTPpGPsxAUHMae4cVO2HbxsR0c1gyImj49dQrlr+ALPT3RNmJ5WUgf+x/0Td5KF1JW
         +nYlSUg6zc8Ic7hPZVAbRCXzwt34fvy5uSsBcitHx5cdPEqR433e7cSUm3OUPSMDphEG
         MyFiOgiHj9r4mzmHe5BtRzwkHyrBKmb3eMs2tylcVuPftX0zuEPVVXTKgj0i+QaM5JkQ
         aPlM71+9Rsoa6Yg1uja4a76KLqO6HznwQ7ESXYk+ZXhsuEwoY0N42QCgofzSoidfAYja
         EhC8tmzy9OTIkfLP5PuW2ElhjvDvYNeb7EfUF9bupE8I7VmjX4gcgofc/lfGcPGxhN+f
         oaFQ==
X-Gm-Message-State: AOJu0YziG2tWqUdbZsxxuThPexHVve1Vap15cG0AoVnFDrrq/i4YdsFT
	trzlz9EU8Tger8MrxdIEe9tJqJtLdTTwKZdUwEzQ/Al7Zp+dUN6xOPqE0HczigdY
X-Gm-Gg: AeBDietD0FsM658outJVFOcddm3fZw5CHU37qmjVfzR7YSqlTnBzgkPpdqq380WYsQ8
	bnsB87X2ZcOuiRBttXgpvkAHYHo2F27prC6VrYpqvnFhxlp05TooVcsP+BrC3OYNhzmj4xQaJIJ
	M3hu2ZJMfyzkjb8ZEmV/zvMezCMfLxNjXUETYxkbeI2CcVWnfTwbFqcJUGs76wEc5p1unPK2U1O
	5GYSO+7eJcxWbQAsfNJYXhoOKKu6ohHi9dW+Ivwj+4FUaQgGaOhOF0WzG1MVU2rLUFFlXH+yVdc
	To0C9GeEaQ30nbnru+NEwyVkJevyvQl2+KIhmjaJtZAX1mr78Iy3FA9PuVO6V8ypd4tu2qnKX2o
	kSXykC80iTiIlImVx0lVoyXcg2TN2VSApRbWIzAjh3s45t0xbTePw7b3ExAxuH+lgHAnjUhIIep
	N6/Ztrj5rllUDjCxuUSptjppah8qv8StPn6WS4NcXeByXcxNM3dTHL1bvwDKrnHN/mu1xxQ8Q7v
	1ccqMUsR4l3B5B7Xh0G9mITpXFO1YBH63ROf0o5JLn1CFsFf1ntk3jXZRuYDKR2xNNaXchNF2Ok
	hp5CYRDrtu5i53yTtILoc5HQA1sRp9BEAYYTxqOTrtBRE6//Wbdw
X-Received: by 2002:a05:622a:4d06:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50dd5b7626cmr74237591cf.29.1775860683842;
        Fri, 10 Apr 2026 15:38:03 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([208.80.35.36])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac849db735sm41370096d6.2.2026.04.10.15.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 15:38:03 -0700 (PDT)
From: Tamir Duberstein <tamird@gmail.com>
Date: Fri, 10 Apr 2026 18:37:59 -0400
Subject: [PATCH 08/14] Drop redundant read-only property test
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260410-harden-type-checking-v1-8-fcf314d9d748@gmail.com>
References: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
In-Reply-To: <20260410-harden-type-checking-v1-0-fcf314d9d748@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@gmail.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openssh-sha256; t=1775860675; l=958;
 i=tamird@gmail.com; h=from:subject:message-id;
 bh=3ywxRA3QVis+3J0Wtq89PIX/RjGT9IDb1vDzq8U/ZEA=;
 b=U1NIU0lHAAAAAQAAADMAAAALc3NoLWVkMjU1MTkAAAAgtYz36g7iDMSkY5K7Ab51ksGX7hJgs
 MRt+XVZTrIzMVIAAAAGcGF0YXR0AAAAAAAAAAZzaGE1MTIAAABTAAAAC3NzaC1lZDI1NTE5AAAA
 QGRc7xqhwNmBQWt4E4eRDfRTCuSjRHe1/tXTKBa1FRWmMrE+gU2HMbD5dJybV7cGdAHbT1yzjJ2
 Qq9pUbU3HNQg=
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

