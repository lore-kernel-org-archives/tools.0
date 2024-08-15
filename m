Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E61714D0
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 13:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729007; cv=none; b=HAe+BBokLJDGdHQX/J1PXSx8lnpOeNzZyhhKJeEvzChprPq9kayqTMmqoCNTlP7DgELqyyWcd+e88eBaw+Ukr93Cab5e6hP6E88lJM6AQHzDplD0cxAXLnOjDcZRX649uO3k4fsOAqD2dcwTzbIOlQrEs0Hn5ZdVZ0BFFiyOgro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729007; c=relaxed/simple;
	bh=nzP8XDAbIq19Qs/GIeg1VyOp9lU05l3QAv0sLECtoZo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XsJbNPgQonoNDRjicV8ryVMGNb8Dw2oqQgAEwZowSxChmRT+AW1cXbclYfEfR3qNFsEsCAU3nVhDDpc+Iy6O/rzZwYlSCl2U6zvm5JDEW9hWSqyoV5Cy/X+W/0g6VuxQMgwt5GlQHcgEcBz4UW3wFKHbxxuXS2voT1vZ8A3Zi9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fcu1a3T4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fcu1a3T4"
Received: by smtp.kernel.org (Postfix)
	id 2EC4DC4AF0C; Thu, 15 Aug 2024 13:36:47 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 1A50FC4AF0F
	for <tools@kernel.org>; Thu, 15 Aug 2024 13:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 1A50FC4AF0F
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7ac469e4c4so160206466b.0
        for <tools@kernel.org>; Thu, 15 Aug 2024 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723729004; x=1724333804; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cLUaVSKinf1PflIJAUOBsd1X3XVX5UikXZUGhf7Ntkg=;
        b=fcu1a3T4PHFulVePLt+vPKXzBtb6EMW16ErHs2P9FgN8rwWDL52/RXdCpwnL8uJYbS
         2uriNTUtN1mvtvC0DnshSBws0jIIOQx4x5kn6li7Nm4/OLivnrYrtvdEFpZObL2IM5zF
         MoFo5igujSCr61BST4VvG4DeM4zg4MikeSJmxahMKNLajC0a3RFfij9ZQhAX75eBYFE/
         5eRCdz10bnGv6JNqmLpFCa3yOVLXU/FApSaO7ifxXFGVA+3be+Oc616uLKiOSKso3NZi
         FU9daMchmakuaPdfgoNChlfuZb2NxjoCyCPf04s1lYtJRT4MwaFhuSfZLSeDS2SaOVGv
         AlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723729004; x=1724333804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cLUaVSKinf1PflIJAUOBsd1X3XVX5UikXZUGhf7Ntkg=;
        b=QRUogHl15TNFoc6mB6EtKF/OiuCWtJOY1Z0g46QHoEl/vzbVs/ama7tiIw6HbplW2o
         OpgPCIdGThjLzVdP54UXH6LOT1oy0GF6fhB1DrgNml8SZJcdhmGtHw2hsVEM42hv6ZV1
         jxq5mUsn4MI9RcH7PZuwEIXBVbcZ/52hRj+rTXEZht55maUDf7k79JzPbioS9dCZssf0
         U1F6eWcJjAJdj5ARRRqfZ7TLignaA7O7UUqN+Z2271cwoiFKJLhAXyhPKK8GcEj2suVg
         PLTqV4UjdJ8Kwr2mh2mEqp48Le6wAfQahQi0+8OpP0sOmqcX4eiggExB/Y8Pjcf0X5gY
         yb6A==
X-Gm-Message-State: AOJu0Yzpybm1Kwa4JorrobVgHIeKvTj6gIXKsB7cind7NY4Vu3NAevhi
	6zkO9QNvIsYoHyZfA/CcQM3/VSifQISS1X2Xqkaf9OIcjFCMHBjH4HKQAWIXry0abBrs4qMIuvU
	7W/4=
X-Google-Smtp-Source: AGHT+IHo4gKyALi8rUbZdBEUr1laqzfN5tVM6O9bDQ+V3dOD7cClidn5uw/5cu13hlqY2U95DaFEig==
X-Received: by 2002:a17:907:3f9f:b0:a6f:996f:23ea with SMTP id a640c23a62f3a-a837cc95f01mr294274366b.15.1723729004414;
        Thu, 15 Aug 2024 06:36:44 -0700 (PDT)
Received: from [127.0.1.1] (adsl-122.37.6.3.tellas.gr. [37.6.3.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d375sm102979966b.221.2024.08.15.06.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:36:44 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Thu, 15 Aug 2024 16:36:27 +0300
Subject: [PATCH b4 1/3] ez: do not interpret 'prep-perpatch-check-cmd' str
 as list of chars
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240815-extend-checkpatch-v1-1-ab7f654be699@linaro.org>
References: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
In-Reply-To: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-49d31
X-Developer-Signature: v=1; a=openpgp-sha256; l=1184;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=nzP8XDAbIq19Qs/GIeg1VyOp9lU05l3QAv0sLECtoZo=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12Z1JxWmRHbWtzM3BEUkF4YXAvVkNzSjd2a1ZqClRwVHUrMVM2VnNkMDVQc0lF
 bGFKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnI0RWFnQUt
 DUkIzS2Nkd2YzNEowTkdwRUFDZDdYMmVadURlZERmdzQ1NXJGaFA4ZnY5aTNWZjhvdXR6czV1eA
 pNazVtd2RmY3k0bi9ud1A0OVROdFJtbXFTa0oxQVdoVUxQTXdneW5ocEs5dDFTZ2hVOHBHZ2NnY
 y96QWRCQ1FNCmlKRlk4S0Y1aXB6Nm1HRUZaN2xkUEdvVG4xN25pVGZkcDVRNHJxRDdVRlNqeDBC
 aENFMDJ4WENURzhqL3JlUlYKSUMwNVZWa0N6UTg5dVZCbEtSNmdmRmZYTXRMOVpuSEg4Y0dmMWF
 6ckY2VEt6MzkwS01kMmtoNGNNREZYLzRhTApoS3VjWlFGMjlnT2RieDR2SS9vcUQwNmZ4ZTlsSW
 ZPM28xMlA5K1E2OVE3c3JpYWNmeVg0djU0UkFWMFNGd3RQCmV5b0VKTVRxUUZ0cDhzcnpKSjJLN
 UxIbm5maVBCTzJZVGYzQzNTWmpMM3lub0tIcUNuellLeVhydFFUK3IxcjkKa2ZCL3dwcmV5YkhK
 b0Q0bHdHU0lhU0NjZzZBQ0g1L2hqQVozdkIxWFJ0dlRCQmo4bm8yQ01Gc1kwRjZVWFlLOQpzTm1
 pS1JoUEhpQmd3aE5NYkVBUW9HNWp6QUxNaEM1Ny9GM3JHK3VrVVovd0Jzdk81L05lWk9aeVJLL0
 0xOWdiClh1QmhyMmhVRUdQWkE1Qi82eGZwUTRLS1BMTU0wRzViV2wzbnk5dGZCME1YTE1XS3Nqd
 FUwVDgveGxzakRvbVUKRUVwNEoza1BLZnRPM0MxaVFpemp4bVE3bE1kSWV6SStjWTc3ZXhQdG1C
 b1B1K2Z3clNlSTlQdWdIbGdvTVJHaQpPYXRmZ3NFOTREcC9tNk53OVZQZUhVODhRVGR0UHdEQkJ
 TeVg4dkpoUGVmV1dpa0tSVDlTdkRSMTgrOUxoRFZWCjRIQW5xUT09Cj0yZkNWCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

config.get('prep-perpatch-check-cmd') returns a string, which in python
is also a list of chars, which in python is also a list of str. This
leads to a moderately funny failure where b4 tries to execute each
character as a separate command:

  $ b4 prep --check
  Checking patches using:
    s
    c
    r
    i
    p
    t
    s
    /
    c
    h
    e
    c
    k
    p
    a
    t
    c
    h
    .
    p
    l

    -
    q

    -
    -
    t
    e
    r
    s
    e

... and so on.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 src/b4/ez.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 22a2cdf..20fbd76 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -1666,6 +1666,8 @@ def get_check_cmds() -> Tuple[List[str], List[str]]:
     scmds = list()
     if config.get('prep-perpatch-check-cmd'):
         ppcmds = config.get('prep-perpatch-check-cmd')
+        if isinstance(ppcmds, str):
+            ppcmds = [ppcmds]
     else:
         # Use recommended checkpatch defaults if we find checkpatch
         topdir = b4.git_get_toplevel()

-- 
2.44.0

