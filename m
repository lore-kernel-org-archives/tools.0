Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B39A78F3E
	for <tools@linux.kernel.org>; Fri, 12 Dec 2025 06:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765519590; cv=none; b=AqN8soK3MlssvRe2+OFu9yFlMUiS8sZzlPTIeIPGu7RDbIOfsSDAV4a8yuE+pzx+66qpQY+8xzjH/YwvCb9VBOtgLQmwnN2RHR5hzMkd6mnZI5TmDNl1am230TObJkz9mnPANRrrF1Yk+S/Hom7UbmjeVa0zFtOhLUuBj72uvQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765519590; c=relaxed/simple;
	bh=sIaLwecor8ZnxgqzbV0//IguXH0zFpv4Jr88EkeTJUo=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=gf3GRuVC1sSbXeUsQYeVQIIR2GxMCRaiz+pSZf1fSNAWkUemYzgIp02xwg2mvHzTrXIBF6R+hxrkoDLqRlZ+w8X9KJRtOCgmFYgaHCX0hWmoTlljUfrCmQNzjML9+uory/giBZjfoAowaVdA5uDlRLisDqqeGqbW6+l9dL75nBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PhWKLkSC; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PhWKLkSC"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-78c33d0df85so13007967b3.0
        for <tools@linux.kernel.org>; Thu, 11 Dec 2025 22:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765519588; x=1766124388; darn=linux.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cpgzNRtRsp9ztwW7oYnT40ZdvaL/afMwvyQ8c+ph8cQ=;
        b=PhWKLkSCPlHVodpOAM8nlAzxSk62rE9EBootQJJ0RY9bvNrhMnuLAXdmR/rgYdtGrl
         fIIxjJJRKVXX9phjILdoyNeorVMNr+DmAOwoUcgWJDAq1A1Mx59+uY4CZaWf4DL5/KW5
         TO2dim/3adIjGVVEveeMaA1hI4hVqhGuyvl7HBnD6nI3USL2fIxLDzIEN0PXIWa6Be/0
         by2//NbLdW4QDD04H6n3TN6JAptLtONiYgSSbkoXT17U1/k7jUvXyqygER3HpFcwoBvT
         x7OfOZnmsAzRW3jLTT9FTV87vRzu2V26mi/AdzojaV35mob8fxLrixtDqqWIIorS1Gqp
         nFaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765519588; x=1766124388;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpgzNRtRsp9ztwW7oYnT40ZdvaL/afMwvyQ8c+ph8cQ=;
        b=WZQVFwNLqfb6uBuM0b7Yjdz4Q+89wYUgIcTFOgCN6dhkW9Fl2THGxsXYfxdIo75WL1
         86pw5oH8cUL+Rtbohadc9rvthLT2sxfaGrlBWihXqciMntUifhIq/nB99xETSuh2INx4
         hqQ3TZyg3bcejbB3Up2Ne4Yqgqxwyi4gN6liq9cmaGPskqXPJB3u3u/gj8p4uD8WsPhN
         yr3j1QAj0wXocVUAsqmZOjBLqI3xf7pdrON8SRUeVpjyPh+quAEGfdfwVFfwcjQPfdTK
         gNZwZj3UZfl3A151O3GRLyPj6voNb14U/LA/v+052CWgXsnFIV6RFW8kanJkqProp6sl
         25+A==
X-Gm-Message-State: AOJu0YzkV0JNDJn/U2jV+oi9fft2Du23CYi8eScTCVL9rSxIGHjXu8Gf
	8rLLURvWQ/J/pc92GAr0NTTcbFZpSuJbSTC31TB8eNxdWvr/asiiLesp2WtT3bGZvQeOsgIR4Gd
	04wmmkjMCIlzIJbUbeIRvinelYFNsLINVPG9B
X-Gm-Gg: AY/fxX4yO5l/Vh2uXNhPKeD0bvIUINgOO6ygv+l6bz4KHbPAYL9mbnLzT6HpgeVXyGE
	hhBvE0Ldm6vNBOXxqfg8j0T+53QmAsWzPpV/iyAO0OMJYvJLktCmZVu8iAFAv76MfKAmgBd9OaR
	nSQJdMe2jmrj/52/t/EKk9A6xRXDT5Tf5xLx4zNUbLlaPc4VRTKUhEK/t1LvfrFbrTV1oUurWL5
	3cbR9NYwW+Vp8WRI0VfdbElHrd59w0W9wJOiVu3+vTxB4Ab03YrtNk7dfDgOxxTuzIl7dLfdCs8
	vBzMj+D/yzaTsQHJBhyoBgvwTtFdBYDUEwHUP0A=
X-Google-Smtp-Source: AGHT+IHwhKBp7JLcKWLieodBfx2lld6QSKJ3l3Q7hew7v18vStWN5BvK87TL3ewaarkBUlUia9pgB7zsKU+Aw4n30xM=
X-Received: by 2002:a05:690c:260b:b0:78c:6a5b:172a with SMTP id
 00721157ae682-78e66d466b8mr8205887b3.13.1765519588007; Thu, 11 Dec 2025
 22:06:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: "N. G." <mailforng@gmail.com>
Date: Thu, 11 Dec 2025 22:06:17 -0800
X-Gm-Features: AQt7F2pV4P--H6MVPqEdfcOzySq_jFeYIuDlDfojS6fRZdbSqbU6zl4iu9vYHYE
Message-ID: <CANKRBiJmWWaNVonGhJ0+T6mpUSzAVxoq9ZoqwKNTQvDH0SwDJg@mail.gmail.com>
Subject: B4 - Badsig error
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I am attempting to use B4 to install the patches at
https://lore.kernel.org/all/20251022-uvc-grandstream-laurent-v2-1-8c5c20d6c=
571@chromium.org/

I edited my git config to allow the tofu attestation model according
to these instructions(https://people.kernel.org/monsieuricon/introducing-b4=
-and-patch-attestation),
but it didn't help.

My goal is to restore the basic functionality of my webcam, which
still works fine in Windows, is recognized but doesn't function in
Bazzite.

Output from B4:
:~$ b4 am 20251022-uvc-grandstream-laurent-v2-1-8c5c20d6c571@chromium.org
Analyzing 3 messages in the thread
Analyzing 0 code-review messages
Checking attestation on all messages, may take a moment...
---
  =E2=9C=97 [PATCH v2] media: uvcvideo: Create a specific id namespace for
output entities
    + Reviewed-by: Laurent Pinchart
<laurent.pinchart@ideasonboard.com> (=E2=9C=93 DKIM/ideasonboard.com)
  ---
  =E2=9C=97 BADSIG: DKIM/chromium.org
---
Total patches: 1
---
 Link: https://lore.kernel.org/r/20251022-uvc-grandstream-laurent-v2-1-8c5c=
20d6c571@chromium.org
       git checkout -b v2_20251022_ribalda_chromium_org
ea299a2164262ff787c9d33f46049acccd120672
       git am ./v2_20251022_ribalda_media_uvcvideo_create_a_specific_id_nam=
espace_for_output_entities.mbx

Thank you.
