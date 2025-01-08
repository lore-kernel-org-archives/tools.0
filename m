Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DECA32036E2
	for <tools@linux.kernel.org>; Wed,  8 Jan 2025 20:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736369944; cv=none; b=Iq+WasQw0z+hnuy066kiKmneO5vv4f6Ua7ya3WruijxdymEt3A79ZxwbxjFcuY42Hx0yZWtZUj19dNg0pfdNgDJmXHcyWaXNL7xUH8gt6M8ZUXmrI/ilgUOeucHROvf4Oe8zfOA+ORLGNp3hrCCnuK5s5+h58JmkIzjNHWVLxpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736369944; c=relaxed/simple;
	bh=ZiS5BxqAt0stHn7nRyRvRYaUkzP0iaWIsef6NkV1tSw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RztQ7nLjns3l3LcdHtUrpasJkkRahZ/8Z+Lj1RCu7Tgbs3/GStKbh7muQ1TPJj6hJ/g9sg4IgPR0CmkadnedLz34O7+u819/ttV0VFOzE68eNgK5wP21Xchs9Vz9Kk+7uNTxh4Jvn9miOPtZesybWkUp7ZrmRjZx62tsMiLpRTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1w01JdS; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1w01JdS"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e4930eca0d4so223099276.3
        for <tools@linux.kernel.org>; Wed, 08 Jan 2025 12:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736369942; x=1736974742; darn=linux.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sjKGMjRv/PZid3wy28UScWgHC7Zaciv+JhD4pnEJ9WM=;
        b=c1w01JdS8SxwBYzSdo/COCBgo+XnAV5Lp4OETcyIVSP8FUwqVV2rXlgineSCuCZylx
         vWUX01UckKPvKpp+me2RUHgaDgKLqioQXpMKPpVDgirbco0C4LvCPTblajaM82B3y+DW
         4YyhGBgddRIKXF0aPHF9Mo7pRSZ0FCbkWvRS2CjKCflJZdNAMYcRdS+4zGy8sV1Ake7b
         mZhvd60XjgLZKPsUoqvB7jWTbpzyRRN7OnnjMOe9bes9s5VTxsTTDI6ThOBl6IjE3EK8
         Lb7Ub3lRpedn/gt/qCqwIWQMs26htxRPWH7sOyPwyjeUVJTWQFhIZl6deRTK8WXOthNC
         L6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736369942; x=1736974742;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sjKGMjRv/PZid3wy28UScWgHC7Zaciv+JhD4pnEJ9WM=;
        b=iFGF24VQ/u6m/50OPKxebwEBRRu9ZXmA4zYpdcxPqLrHqaYYRj06p/YPAYpEBcoNB7
         vrHk62usjhjg+L17/YGr4iXuyL4Sxfm2tu/DsQwfnIndbup9t+FeL6jrV8SBFTAjsvhr
         lRa724THXJgKI9gHY1+uBj1sj4WVcpBP9oMDNhIaWFjyGsQLq/bSz0r/FXh47kS6XKNn
         73vqgtSGFpoKM9CVcfHd4kTt/jIVRYXeGHgADVcsgDLMHpjxYyrFt4pr/pWXt2ka8lqp
         5+ntwOuzx7Rz6BfwtmJd3fOLw9ZWiubLYkXqsa+5lXqXSmi9GrVcAA5FLN5/v7oXKseL
         OhZA==
X-Forwarded-Encrypted: i=1; AJvYcCUYI9/RUZnhP8qwK5HHld+b4SQWKat4gjUQNuBvuDnO3+LUVwORYqmZF43M7ovdTJgyWCphQw==@linux.kernel.org
X-Gm-Message-State: AOJu0YzUX1WSfA3p01NaNp1u6XBMmB5UUCUzrbK9loO9mDujcKbQV8Oa
	ABB/tFoSfQd2IDemOVhZlcxKn94MnV1r83pquSL+ukOF9KpmyL31ayIVk5Ihy++d+jjLMpBpePn
	vPoh9WkmebW7oxZa+Qs9X/U9xmFclfDBOWA==
X-Gm-Gg: ASbGncs9R7szXnWUZZloq7xFFg597LLLUN6tBgeV3Bf9culPQXlkUo0k4dRuwCijcAk
	WSBwFymrI0ofie5rK9Vx889hseFDMzKuNKA==
X-Google-Smtp-Source: AGHT+IE2Dl25vLS2lFd+jXZ5iqTgBIdxruqmqbpqqpJkUKOn1X4MdRUyp8KuRRHvRSJeonl0vDju/SbpI8cI9iV2Yb8=
X-Received: by 2002:a05:690c:6b84:b0:6ef:801f:437d with SMTP id
 00721157ae682-6f5312dcd3cmr37679307b3.26.1736369941735; Wed, 08 Jan 2025
 12:59:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Rob Herring <robherring2@gmail.com>
Date: Wed, 8 Jan 2025 14:58:51 -0600
X-Gm-Features: AbW1kvbiwfy3dM5EmjNQB-ardmbkGi-flSkR2HDCwn8uISGr2lrJSTPor-zsICg
Message-ID: <CAL_JsqLLOnpAHM38Bv05JdC1o0rS6eUG6WXgPHfnChs2n+AuWg@mail.gmail.com>
Subject: b4 shazam base-commit handling
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
	"Kernel.org Tools" <tools@linux.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Konstantin,

I found that running 'b4 shazam' doesn't honor the base-commit unless
you use the '-H' option. Is this on purpose to avoid resetting the
user's branch to something else? As I recall you had reservations
about that. That's fine, but the log is pretty confusing in that case.
For example:

$ b4 shazam https://lore.kernel.org/r/20250108-adds-spmi-pmic-peripherals-f=
or-qcs8300-v3-0-ee94642279ff@quicinc.com
Looking up https://lore.kernel.org/r/20250108-adds-spmi-pmic-peripherals-fo=
r-qcs8300-v3-0-ee94642279ff@quicinc.com
Grabbing thread from
lore.kernel.org/all/20250108-adds-spmi-pmic-peripherals-for-qcs8300-v3-0-ee=
94642279ff@quicinc.com/t.mbox.gz
Checking for newer revisions
Grabbing search results from lore.kernel.org
Analyzing 3 messages in the thread
Analyzing 22 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=93 [PATCH v3 1/2] arm64: dts: qcom: qcs8300: Adds SPMI support
  =E2=9C=93 [PATCH v3 2/2] arm64: dts: qcom: qcs8300-ride: Enable PMIC peri=
pherals
  ---
  =E2=9C=97 No key: ed25519/quic_tingguoc@quicinc.com
  =E2=9C=93 Signed: DKIM/quicinc.com
---
Total patches: 2
---
 Base: using specified base-commit f486c8aa16b8172f63bddc70116a0c897a7f3f02

^^^^^^ No it's not. If it did, there wouldn't be a merge conflict below ^^^=
^^

Deps: looking for dependencies matching 4 patch-ids
 Deps: Applying prerequisite patch: [PATCH v3 1/4] dt-bindings: arm:
qcom: document QCS8300 SoC and reference board
 Deps: Applying prerequisite patch: [PATCH v4 2/4] arm64: defconfig:
enable clock controller, interconnect and pinctrl for QCS8300
 Deps: Applying prerequisite patch: [PATCH v4 3/4] arm64: dts: qcom:
add QCS8300 platform
 Deps: Applying prerequisite patch: [PATCH v4 4/4] arm64: dts: qcom:
add base QCS8300 RIDE board
Applying: dt-bindings: arm: qcom: document QCS8300 SoC and reference board
Using index info to reconstruct a base tree...
M       Documentation/devicetree/bindings/arm/qcom.yaml
Falling back to patching base and 3-way merge...
Auto-merging Documentation/devicetree/bindings/arm/qcom.yaml
CONFLICT (content): Merge conflict in
Documentation/devicetree/bindings/arm/qcom.yaml
Patch failed at 0001 dt-bindings: arm: qcom: document QCS8300 SoC and
reference board
error: Failed to merge in the changes.
hint: Use 'git am --show-current-patch=3Ddiff' to see the failed patch
hint: When you have resolved this problem, run "git am --continue".
hint: If you prefer to skip this patch, run "git am --skip" instead.
hint: To restore the original branch and stop patching, run "git am --abort=
".
hint: Disable this message with "git config advice.mergeConflict false"
