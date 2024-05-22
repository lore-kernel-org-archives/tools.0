Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AC9140E3C
	for <tools@linux.kernel.org>; Wed, 22 May 2024 16:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716396048; cv=none; b=IK3gVOL260qPDfc/iqpIx0qVyBO5O/CDUjkWvDaxZ7JAp/eyd5xo/mjP5YHBRxi3yb7i7T+g/FxC2TILCzlapIgiztaDnZRs9UBZAs0EKcnQtZDSETpKUXiqlk27GTDkf75DQK0Rw4EDQs2UJzQvouSPFFC4zgZ1Iq53knZ+YMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716396048; c=relaxed/simple;
	bh=U5chbncXQKmkgikWPh34JpCxDy0rrGnMJVgMS3XPAvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GYlXyZWFTwsDmRpfUdqMx4N2QTlWehAu2skDgoYp4+i8QvAXCArhOhsoJEKR1ukcJi2nXbZ1g194OcJRaPOvk9kSHtg3Gn96Zfxv8gqbal9pVjLlxefMluXRi8q+aObsASwtI9wNvRUF/lW96VS2dzAVsC1T/0cfptIGq1sdADo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BRB+adaQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BRB+adaQ"
Received: by smtp.kernel.org (Postfix)
	id 019CFC2BD11; Wed, 22 May 2024 16:40:48 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E1453C2BBFC
	for <tools@kernel.org>; Wed, 22 May 2024 16:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E1453C2BBFC
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52389c1308dso6685679e87.3
        for <tools@kernel.org>; Wed, 22 May 2024 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1716396045; x=1717000845; darn=kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=H4QjRskvP/DK7ywrrHzJQ2uVVXJ4vyo3BUy+gMmgHUo=;
        b=BRB+adaQfgoUsNxJ2DpkNHVOM3zN92tHo4x1ZxV7vzGFm/m05Pka49uzkn4xrkvMnw
         HGVbH6i9UOqz9TufXcdFW1bg28BIbDcNQFqTy+MmUZYgc+rVcqB40Ca3VKb5pvCGmB1O
         VKM2PwVk2Tmlu0qMmKZG38tcK7zyNO9FhdleY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716396045; x=1717000845;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H4QjRskvP/DK7ywrrHzJQ2uVVXJ4vyo3BUy+gMmgHUo=;
        b=nts5aXZ1jqvo2v5tjy3rhYLnkjvFlERE21C/PxbsGWjAcTC/V9NxokqqzhMtdDwcC5
         auDLlX8sb1zqa7THysFH+jLyAQny6x0PO0aNMkBw0p0oGztgO8cq7DgdRbYL6DJLMNsA
         peW//ieWAOpS7O1m8FAKNG6vTkQsZgSanpY5nrK4n3Fu+YymO11/fQlXgVWYtLA4It5T
         L/aUL3dJiXU9wtQHJHTyU7qXev/P0owT8zklcyJr7rdMk2Zm+ziYN3WWI6RXVYizx2gL
         qkDUo96gqhfDdBtuY0g7E3FnmjgZZCgJE2TLwrfSViXiYHmwv4leD2mepuwMVlVLboaD
         HB2Q==
X-Gm-Message-State: AOJu0YyLh+PYaXW1KL0BgLqUva5ClUkx6XSy567l2F+pw1OWenY8sUM6
	kAUMRfDJR1Bgus3ge4/ecAHv1ARTt8maeScVPbE589Gq2EdbmOry07U8sQ7aTbgc/8/TKxg+1KB
	XW5/JFw==
X-Google-Smtp-Source: AGHT+IEkWh+ZbYJz+sRS+jMCai6TfGxYFBSqQzVtZN8gEcXJCsAHUNahsPcOLmdu1TGSZDSeIc6Erg==
X-Received: by 2002:ac2:4119:0:b0:51c:d528:c333 with SMTP id 2adb3069b0e04-526bdc5268cmr1361588e87.20.1716396044751;
        Wed, 22 May 2024 09:40:44 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f9a9563dsm4886138e87.74.2024.05.22.09.40.44
        for <tools@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 May 2024 09:40:44 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-52742fdd363so694201e87.1
        for <tools@kernel.org>; Wed, 22 May 2024 09:40:44 -0700 (PDT)
X-Received: by 2002:ac2:5442:0:b0:522:2fa0:c3f5 with SMTP id
 2adb3069b0e04-526bfc02eb2mr1518662e87.62.1716396043734; Wed, 22 May 2024
 09:40:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
 <20240522-phenomenal-toad-of-might-4670c7@meerkat>
In-Reply-To: <20240522-phenomenal-toad-of-might-4670c7@meerkat>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Wed, 22 May 2024 09:40:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgK-YJgQ3nUB+VVecK-xQfvMxBzQxvd3E5TV1hbVf9h+A@mail.gmail.com>
Message-ID: <CAHk-=wgK-YJgQ3nUB+VVecK-xQfvMxBzQxvd3E5TV1hbVf9h+A@mail.gmail.com>
Subject: Re: b4 patch selection logic
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 May 2024 at 09:27, Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> I agree that this can be more intuitive -- let me see if I can improve it to
> automatically apply --no-parent logic when we recognize that a patch posted in
> the middle of a longer thread is not within the same series.

My gut feel is that if the message ID directly points to a patch, that
patch should always be in the result unless there is a newer patch
"below" it in the discussion..

IOW, I _think_ the logic should be that the "walk up to the parent"
should only be about finding clever letters and finding other patches
in the same series.

But I really haven't thought it through a lot, and maybe it breaks
other real-life cases where somebody has posted multiple versions of
the same patch in the same discussion.

One solution might also simply be that when b4 finds another patch
than the one it was pointed at, it always just documents that very
clearly in the output, and says something along the lines of

 "I picked another patch, if you want the particular version you
pointed at, use XYZ"

At least in theory, using '--no-parent' might not always be sufficient
- maybe somebody decides that a newer 'v2' in the same series is
actually a mistake.

That said, the times I've hit this issue, the answer has always been
"--no-parent", so that "I want v1 despite there being a v2" may be a
purely theoretical thing that never happens.

           Linus
