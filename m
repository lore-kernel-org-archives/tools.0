Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D77822069E
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 14:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701713; cv=none; b=eFGyc7iMnsZIIRF0T80jKZgnknyF7DBYZL2FOFx4EuTygdnAi6hBHU5sp+eZj82nuYjrSFp0uEzAxdj+/b8cw0gOrY8/whkTj7uAJ5QLH0NLoSpycswnun5ADPAutW3x1mWeQLjbdR82GN4ys60Bf+7kxCZRPRifwWOzEWa4N+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701713; c=relaxed/simple;
	bh=+G7lQ69YAYrHGu0wO/nuhbIZ7lD4xrDdYZjs7vzDKrY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K9t4ihREz+TDmbYsIja4sWfR5E3QeFI7YaKZidFOcByFlFHv+aIpAwx95cj8Yb90dIESMhVc7LWz/vbkC99N2KRYOZzuJlYcqYTfT2oD/eI8/zT0ghEMq77q6u34LPyDh9d5uzHtvkCyCNr7vUr31MTPGnNZ3LQAoxFf9TqRAmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QVQZH2Eg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QVQZH2Eg"
Received: by smtp.kernel.org (Postfix)
	id 83B4BC4CEE7; Wed, 20 Aug 2025 14:55:13 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 76DEDC113CF
	for <tools@kernel.org>; Wed, 20 Aug 2025 14:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 76DEDC113CF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afcb79f659aso1004037566b.2
        for <tools@kernel.org>; Wed, 20 Aug 2025 07:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755701711; x=1756306511; darn=kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVyfniqAQhDd7Tw5CeFLtl2bt3nWt3z3QA6Yp5ooSck=;
        b=QVQZH2Eg+RmGbgZLzRDcrrMblIYJtalyVoP0oVFrluMluoqNN358VB2pM5Cisf94zA
         o1tVFyqZ218UrmPDPYwf3KzZ+l8DNktMWfrV6U+c3m1K6BVNDQuHgEUlYU5JND1xy+US
         lDzNF8Rwn+Fk8+QBJxt9yxPQfmV0zifupnlf1Uvuoa013DeJPr99uws2TBT7Dn1xktIy
         TyOinXglbcYL7GXjbUM/9FC7yNBYaMnNPlroE6RXQDTLNSL1HywLM1nyDZzDKCujYKdv
         lSv41Ym8k5N+SaBhLUZbMtMGLFo1UGe/zKuxDhj2/Ek4F7Etm/tZPkgWg/iCDr9cOIjq
         heZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701711; x=1756306511;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mVyfniqAQhDd7Tw5CeFLtl2bt3nWt3z3QA6Yp5ooSck=;
        b=lcKgqKUbBKUilknDq6uQA7HFESgSCA8qZO0D96RivJT03U4eytdq9ME4G9PZo/TjQ2
         d5TcepGVxtgjix72SXglwZlvbu9WKW6DDjtEJUZlDHzJPpaqFZU/u9W4cfYWkHV5QboO
         mQcnrLEqnuECcbY9wB1AZRSV8cqeLWl28cvNuGvMmf2cmfmWhw+7qKQND4cSBvSGKNBp
         3F8lM+WOZ0SGtxketcx3iWlAavcIMzSTaiBHsQ1CHDe8It9owzEojPtk71fdt1TDtXOg
         tMKxQhT+fprNMlphSxcPlYr+7ZwTvHB5rtqZo9qNjefl30qpBL8guElFqBUKrjV20tcW
         SV7Q==
X-Gm-Message-State: AOJu0YyLC1ViQ8yZ/7z2qgadBQkvoG10O8rSxjzktX6/JDHEbi7BR+tc
	LC3wienyF+qYpdkmOKpnp4NRxHDC736BA3/upHhpmLGkedZn0fuuse0eWnX/4B1IKJA=
X-Gm-Gg: ASbGnculGO/TfIm7R3e9spDt0/6JWtp++h66N90aY1NJCr1SXdliAO83q+wuMN5ChYs
	Pv9Zly8aDV5Wo2rIfbApV3eYM3PhoustZMt3MCqogezRiA961bxUAmxowKCPw5fbev447n9JWOV
	8MKep1U+5eri1qi/pE2yjLDZEdHFnXwPb4/iB4k0zZrUNKM4RSqsZa+A8Zyti7eZDzt+s91v33c
	b21SO9U3U6qG12HLViQDM53WpKDrOO+knFs2NuamIz3FdZqLO7qqvy0vECia5Pd2vtMPHMhafR5
	uzWJBTXxR+5zqE0MC2eB7kUw05wOoE6gGfzdomDFnLJhpXJuDPbr1U9Wa9gC6j6uT4XtFkO5OrR
	VNmCipL32h5cIfmStgw6qxlWMs/aQcn7Cxo/VUrV9kPQM2P0GrgFJgjAoriB9g467upsbbEyV1H
	pdqDc=
X-Google-Smtp-Source: AGHT+IEkBQyPG9usyAoO8cDEHb8kxr2XyiGgDlAvcupx4J7xnFMWib6qjNr/KYXJ7N1wqMo4yIeY8w==
X-Received: by 2002:a17:907:3d87:b0:af9:2bb9:ea36 with SMTP id a640c23a62f3a-afdf004157amr279472566b.7.1755701710590;
        Wed, 20 Aug 2025 07:55:10 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441256.home.otenet.gr. [79.129.180.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3070dbsm187606866b.46.2025.08.20.07.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:55:10 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: [PATCH b4 0/3] prep: add --auto-list-unreviewed option
Date: Wed, 20 Aug 2025 17:55:02 +0300
Message-Id: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMbhpWgC/x2MSwqAIBQAryJvnaCm/a4SLSxf9TYW2g+iu2ctB
 2bmhoiBMELDbgh4UKTFJ5AZg2G2fkJOLjEooYyolOB23xa++8/FEx0f+txUuqhlrUtI1RpwpOs
 /ttBr6J7nBbCiVMplAAAA
X-Change-ID: 20250820-auto-unreviewed-cb3584691947
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-b423f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2072;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=+G7lQ69YAYrHGu0wO/nuhbIZ7lD4xrDdYZjs7vzDKrY=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9wZUhORlNoekt5MHRxM0ZQMGdjSFdJQXJDdk42ClR2MS9yUlZxK0pidWpiZEFy
 aVNKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUtYaHpRQUt
 DUkIzS2Nkd2YzNEowQjlQRC80NXZqU0RqdUtPQUhJZ2d0L3FiUGtMK2pKbWdDMXJDRzRGRFB0Rg
 pxbkZjejJIb3VQck0xOCtEZk1DeE12RjZPeGJEMzlDSU9aaEV2L2lVQlBVY01Yc1VwSlRUYkxsK
 2EyUUM4aTNECkFwZ3FVWGEwSlJXWXdEWWZuVCtiUm9xRU1kckk5c2xaVlFRTXBuNVhhbXgvQ2ZH
 RFl0ck9Rb2x3S0o4TEhHN0gKdGVLMGtDc3RCajZ5bjZzdmdwb1crSm45SHIvUENhUGJld1pZSHZ
 KVEMvd2FYMUNvLy9aY1ZoNmRYZjg1YnFQdgpic3hweExtQWQzUXlmQzRSWGhKOGxPajZNbW9pSG
 Y4S05YMHg3VkJ4ckpBTUhrK3UxVFNEeGhvZGZvU0xlQTVFCjdRUlhOK2dBZU1NY3VtSFdYbzNvb
 ThwSDVVczZTSjlFZTZyREVGbFkxaXJ4THlqekFKWFhXaGtIZ1ZJUzZFWVEKVStQc2ZvL3laR3ho
 cXhqVnl4YUFiUXV2S3hVWUJnclRuY3BkckNDVkx0blJyZWhsSElzdVZUam10L1dIa05jTQpBU2R
 lU3czNnRJdmVNTFQ1YjZVeVU4cUJCU1NDa1FDdWovRnBvd2g2ejlmTkdLZXVjUTdFU21pb1dQdU
 dWaHdRClIrSGZ2OCtuL0xLaXIrQkZwbEpJMlp3UWY5SEtLc0U1T2JxeWVPV3lDZmMyM29jbzB5U
 2JiOVZ5QmNteTkyYmIKY3R3cFhGdDVQUTZiQTY2NzVhVjRVc3dsaDhCSHVXWE5uaWZEaVhxRnJk
 VU5CbTRWaU9VUERPd2JnK0NHWVpVSAppRmVIb1VUZ3BRNWRVQk1JY1BRT2VnUGZlNGNSOGYwVG9
 xL29kMkNUNGR0VlhWbWk5SEZrTXVNczJwVXE1Rk1iCjRPWUlQdz09Cj0yT2UwCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

Imagine you have a >v1 series with over 50 or so patches, and only a few of
them lack Reviewed-by: tags.

You want to help other reviewers in the list help you, so you manually
point out which patches still lack reviews in your cover letter. This
can be easily automated with the new b4 prep --auto-list-unreviewed option,
which uses a new "auto-list-unreviewed" dict key in the tracking json in the
cover letter commit.

See patch description for an example.

Since this is an RFC I didn't add test cases but instead tested it
manually. If the maintainer thinks this is a useful feature, I will
try implementing cover letter generation tests in follow-up revisions.

RFC questions:

- Should tracking json values be under "series" key or top-level?
- Should the template be configurable or is this overkill?
- Should the code review tags be configurable or at least expanded?
  Currently they are "Reviewed-by" and "Acked-by".
- What if a series of 100 patches has only one R-b? This will list 99
  items in the cover letter.

  It's not easy to realize this will happen as it requires running b4
  send --dry-run or exporting the patches to files and inspecting them.

  I think it might make sense to limit the number to some hardcoded or
  optionally configurable percentage and/or upper limit but this might
  also be overkill as this is can be deferred to the user's judgement.

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
Manos Pitsidianakis (3):
      Add LoreTrailer.is_code_review property
      prep: add --auto-list-unreviewed option
      docs: add auto-list-unreviewed documentation

 docs/config.rst     | 10 +++++++++
 src/b4/__init__.py  |  7 ++++++
 src/b4/command.py   |  6 ++++++
 src/b4/ez.py        | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 src/b4/man/b4.1.rst |  8 +++++++
 5 files changed, 92 insertions(+)
---
base-commit: e44bb8727e2b49db66c2c1e2fc2e9b22b32816ae
change-id: 20250820-auto-unreviewed-cb3584691947

--
γαῖα πυρί μιχθήτω

