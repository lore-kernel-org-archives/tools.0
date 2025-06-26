Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673622EACFB
	for <tools@linux.kernel.org>; Thu, 26 Jun 2025 14:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948664; cv=none; b=PQbtFqrxJftUrZL7jJ0jbX0mo1zIsPltlF8JL6esujo6IeYdYl7uEQbSusP29ReqP7sUavLg8RGqzp3eJatA5zeSxvHqe3kcYovxms4I/seiXk/SMBDPtPvztBw0JW5qFGbtrFNuyLbdEN8nzBdYPh2fzvzuRVIm811Q/e7dU/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948664; c=relaxed/simple;
	bh=2qyBxyYfox7UB1SwgkItJVfJgtWZwttY9uqS72wOK8s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=VIwKnqa4Dx4Az1qcXxV1IV4aciuv1JJFFCMYFsCVqQQrwh1sUMRgO8MG3cI4G0yPDAKTx3mmrguiR36Av40nSR1cV6S4kHz0wNPi+y1PmJneY9KfcepW6FFc23UNXfl5FITJqg9UgzFXU9K8eetNu5ZaVc+8PQs7j2oI4uC0Q+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dID+Z+eg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dID+Z+eg"
Received: by smtp.kernel.org (Postfix)
	id F14EEC4CEED; Thu, 26 Jun 2025 14:37:43 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 437B3C4CEEB
	for <tools@kernel.org>; Thu, 26 Jun 2025 14:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 437B3C4CEEB
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-adb2e9fd208so215978266b.3
        for <tools@kernel.org>; Thu, 26 Jun 2025 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750948661; x=1751553461; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2qyBxyYfox7UB1SwgkItJVfJgtWZwttY9uqS72wOK8s=;
        b=dID+Z+egV+Lo7dl3fwfu5111K7KCof+ReV5NMLoctDyZJ3EvZtfaCdRLpU8ZNw0gCx
         69OgyrZgR3KKhCD8QgV9kcOCX7Hc6XFuaKy57FMroEkgc474l+HCqdRaJY3wgTc0SSDU
         RczQ34g5Q1coh4mNAp2sEAY4DhYtkCPE2TW+lrcvh6w5CDCLyI2aOXOksGw6GurqftsB
         OzvtBspQo6YB3moc+txCaF7/ReymiBl0JlT8TCxtIjqP7e5Ne3hx1mYgITBoN7dpy8yd
         FQnN1MD2gg59e0JWtkGd2Y4MxGurVL18F4949EaAIFjcxxXy3uBsEJHgfJbQESNMeKw6
         GHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750948661; x=1751553461;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2qyBxyYfox7UB1SwgkItJVfJgtWZwttY9uqS72wOK8s=;
        b=iNOpqn5F+yFDz8v7COeZWTrBYZ9jdsq+9LJSPTeihN87u5blh03zm+QHCBjzKtML59
         616+hmKrwrgwS8BbxRPfJNZMBP2UYmoiL2BmlFUMMmD+jlnvh7i/d8gLVR6Q3YnxyQVI
         1aBTKwsmBsMPfD+hi+jDbpHt8irE7uzZUaHW/LEK41Tqflisy9MTu5ylZCVAgz9dJG/K
         ima/IQLzjihvxM2lnurUtbeAz7g9rhq1kLoeL39SCp/Uxq29LZS5twblRHO2BMRKJsv7
         UEeoqH8T0UIhF2Y59EgzqGewgC1T9lLhUGzktBb79Zn548/3YJJkvrzH7vMPR9j3nwlH
         cnAA==
X-Gm-Message-State: AOJu0YwWTxjUG2h24Fwy1fDQ0XlUWxvCX2vLhJFrMKH58LeRwDd1rEiS
	RlLE9un5/dW83UFvbktAAZec72RU8aa3UaFPd1/+Vc0HgOvAZ5fGzLyeeMHuFzmL5jUtfyrXQEn
	hRlDPeUhrLKsj+icF8c9DDcKOUVn+qtvjsw==
X-Gm-Gg: ASbGnctk/07YEzSRHcOw7FVPaa47maIOOQkc5tkn1WtvQXYUD77zxmMjPzx1ROLaaHp
	p1rC9HeJVB06wnlgi49FMz8xsdTGfcF2IMpFa0YqsKmnsIWFyuWNCOuwJ1ejtPcVUM1acllnG+e
	ftzBlXbmQ6++4N8HWGgPAawPFeNwCaXwiSPa5wfKwZG5Y=
X-Google-Smtp-Source: AGHT+IFI1FWe1VP12vwR2K4mRnjRcmqInJOu0PIDM8ugi4cFrJtKylTCWc6ZzgeNYDDKKKux/HnpYNkgi0X2W6Agy4E=
X-Received: by 2002:a17:907:7fa5:b0:ad5:74cd:1824 with SMTP id
 a640c23a62f3a-ae0d0cd594fmr433533166b.38.1750948661193; Thu, 26 Jun 2025
 07:37:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Juri Lelli <juri.lelli@gmail.com>
Date: Thu, 26 Jun 2025 16:37:30 +0200
X-Gm-Features: Ac12FXxVFsdUTUA_0fap_MLbYAn-wi-0_2gDyCTH_a_u8No6q2YhQmLD_4_j2KE
Message-ID: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
Subject: b4: Fail to send series with smtpAuth none
To: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

My SMTP server doesn't seem to require authentication for sending
patches, git send-emails works well with 'smtpAuth = none' in
.gitconfig. b4, however, seems to ignore that configuration and keeps
asking for a password (and then fails to send).

Is this a known issue? How can I fix/workaround it?

Thanks!
Juri
