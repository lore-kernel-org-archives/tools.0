Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929E91714D0
	for <tools@linux.kernel.org>; Thu, 15 Aug 2024 13:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723729006; cv=none; b=ncr/AYGuEiJe4DbwTeYWfayox612mJBaejwIEmNBPvNpzPwDhM1+vNRSd949IvWP8DOTXK3HIyprGjlj77R6YASkC9g6NQoNAVoienjqkedizhqhWcUkip/dXwIFgMMZCJTNj/NnO8dNv6NqDQO+Vzm7vZA9ny43ZkAyCtUlWgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723729006; c=relaxed/simple;
	bh=ipr/eVKukNVLTGenHHBFcTM+ccJ1I9Z1j8u7CbklkLw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OegV5pQU9tk86tpfZRccXpX4qr/NX5SG8idDB3Y/F30aLgXY0BDQMCu+hDJ5Wb8TFA6hAC29IGJ4xn4e2IzOB0UvDSDExCpIW2zV7J+TQFGXZAkE/WJTiSMvhGUMBmYIUi8IXLPW4ktSG+/nUwIuReNoBMWpQkaPwojj/phkuDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cY1IvNlK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cY1IvNlK"
Received: by smtp.kernel.org (Postfix)
	id 6C0CEC4AF0A; Thu, 15 Aug 2024 13:36:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6553BC32786
	for <tools@kernel.org>; Thu, 15 Aug 2024 13:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6553BC32786
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7aa212c1c9so120655066b.2
        for <tools@kernel.org>; Thu, 15 Aug 2024 06:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723729003; x=1724333803; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O5qHfqgpFTq8/8ABDdRf8VRq1F6P10FYxQfmzt74NC4=;
        b=cY1IvNlKbpQqu+0N/k8qNPpoG2CyE6HZcWvNzc5syJ8YKffPnfvkOQ0wC6iqVjPPCM
         lWh6aYfwqxxeI3GwDOZztR3QyVsIMcjG7/ti8ohLI4wxvysd5+GKTcalrW8ICsR8pYYB
         rVLvVOsfHfzPQWzQuRPd3A4DsDNiZMuPoxEVtD79xLZt6sI6aRZD+gtuBlTURmC5oiUD
         j6AJueSlI7WO3MagMmkcspCPMPp+XDThVxlS/i0bSlQ+BEHCTha6Tdx7vhCsQ4tuCEz2
         ErAy78dsaDocnG87sxhoceoPJTeV7+0gSlLk3P6SIWVxxZkbuP48e75f41CZjQ6qZ6aa
         jm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723729003; x=1724333803;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O5qHfqgpFTq8/8ABDdRf8VRq1F6P10FYxQfmzt74NC4=;
        b=K//8eT4T2t0D/tl4LjM98z7wnU/NujVhbBRKbadruswm5bu/l5b3ZxxO+hLe6srdbq
         KX3hAJvfvbGLNuRH7J6FscGz/MjD4G6TUyKuetvq7nPKW3PwZsnFq8ZoTR7xi8Ec+HeX
         8yuMO3DkRc8o87CDHMrSMbMrrx4KMZ4WfXnrkJtQ5Oa5UYfl2JpnA5DyrieQAi1yfjwQ
         uZT52kkxdx5MUqwaei3J+NupeFloZ3aYaNM7A08xspC91GeTDu4533TfSJpv5imOhozg
         qIuDpIMFh+0flVH8GgoURN3HDDIOBarhQp97m6S05PrrStSLc81iHKJBH/6mtuCkAWfJ
         qjXg==
X-Gm-Message-State: AOJu0Yw0CyKEPQgACK+m3gKatOP8dydiOq4fjavHZWMmpbQpFE75K+Vt
	8ye+v0+rX3PkEq6jf2ETTe2fssO4NOVAgTBQnU1gTGX7/TZVY8wi2Rue3odv1nw=
X-Google-Smtp-Source: AGHT+IHjVFNPTTj4TVPvXUBcWy9IVs9yqSlBbOZZqFBDn/cHQWvINkWUZKLaBvdLLshTJbqnQph5gg==
X-Received: by 2002:a17:907:6095:b0:a7d:a21d:ffb8 with SMTP id a640c23a62f3a-a83670e5606mr406541966b.64.1723729003476;
        Thu, 15 Aug 2024 06:36:43 -0700 (PDT)
Received: from [127.0.1.1] (adsl-122.37.6.3.tellas.gr. [37.6.3.122])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838396d375sm102979966b.221.2024.08.15.06.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 06:36:43 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH b4 0/3] Extend checkpatch.pl compatibilities
Date: Thu, 15 Aug 2024 16:36:26 +0300
Message-Id: <20240815-extend-checkpatch-v1-0-ab7f654be699@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFoEvmYC/x3MSwqAIBRG4a3EHSeUGFlbiQY+/vISWGhEEO09a
 fgNznkoIzEyjdVDCRdn3mNBW1fkgokrBPtiko1UjW47gftE9MIFuO0wpwvCygXK6sGbXlPpjoS
 F7/85kVU0v+8HmuMPhGcAAAA=
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-49d31
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=ipr/eVKukNVLTGenHHBFcTM+ccJ1I9Z1j8u7CbklkLw=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm12Z1JxVnExTWQ4QU1IYXdvcjNiRDdxczJSV0QxCmxFWGp1SXlObHlUNmtRaUEw
 eFNKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKWnI0RWFnQUt
 DUkIzS2Nkd2YzNEowUElZRUFDQUhHeGJjUDZ3SFB6ZlFYT2NsRUhINm1VTjZlRHZGNlV4Z0FvSg
 pUQjhTU0h1NTd2bVNTYzBPbWN2SzUyWW9WMEZJUnlhdTJzQ29Pa3lTclJ6NzlRTHdDUDZ0V0FBZ
 UJXVHBBRnR6CjVJc1ltbU1neUFYMXFQSXFGdmZBUVJzNTh0U2VMQ29PUHd6QnFtTmF0S2xrQUJU
 azA4aUdBZTYvZUNtcFZOWUoKa3M4YW5OU040VXYxVk1Nd08rQkI0ZjNKRFJsWDMxcHZyMnhYNFh
 pNG1KSzdlYzRGY3JXUnlxa3NqY2RXV0VwLwp2NC8vRkdNamNGVHlKTTNBZEcrejhZVzFuVHB1YV
 ZMNE9jSG5kMEd0ckVQMHA4MDJLNWgxa3ZyN3o3UzlsdGgvCmhRVGlNSHppbTU2MXEyRlRKRU90a
 mVGcmRtUFpWUmlyYjZKLzBSbkNENitSbTYwZ0pPdzFmZkdObE50RTFSN2IKdUJZcW5CWS9uSnZD
 ak1hSlg2TTA4Z2QwR1dYOFR6Z0QxRXZzZlZSenlCV3JoeXRsZ09hQzhnMmp5OXVwaDdRaAo1dGM
 5VWFMM2hxbkJueWxlMGNMMVZ5Q1h2SlNUdGJhSXNGaTJlYkRMRGdBU2psN1d2dzRZb2lpODkvQV
 l3bTJBCnVVT0ZQQXI2dFQzZmN1RGJnZUcrRTRGT3RMVGhSZzRDcWhzbElJTHhxYnhGWkNSTS84Z
 nV6UXlMZktUWVFJWXEKN1g0dzdZemhoTGNFMk83N1l3Smc3MFY4TzNOZDBnMm5ySk11b3FESUo2
 d3FaVy9zeStwcTlNM1YwQnRwU1lTaApiTEk4YkErc3lTWGhtTy93Q2JSaW4rY3NYdEcyNEswaE1
 yMHgyQ0FLcEkvU3NVNlNPVlRneVQrQTFBbyt2a0RPCjFlM3lBZz09Cj1RQi9FCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

This series fixes an error from reading prep-perpatch-check-cmd from
.b4-config inappropriately, and also allows b4 to be more gentle for
projects which use checkpatch.pl but are not the kernel.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (3):
      ez: do not interpret 'prep-perpatch-check-cmd' str as list of chars
      ez: verify default checkpatch.pl args before running them
      Differentiate between checkcmd error and checkmd patch fail

 src/b4/__init__.py |  8 +++++++-
 src/b4/ez.py       | 14 +++++++++++++-
 2 files changed, 20 insertions(+), 2 deletions(-)
---
base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
change-id: 20240815-extend-checkpatch-b2fe4b89da78

Best regards,
-- 
γαῖα πυρί μιχθήτω

