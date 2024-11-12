Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455EB2003C6
	for <tools@linux.kernel.org>; Tue, 12 Nov 2024 15:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731424985; cv=none; b=FYckmoCUJBPB+sJnlqj7lZwGgRxDm0w4EIymWADvZPBB8HXQ+kRY0TBInDGgstr7ESg+oEdw1rhexdnKQSqZGf3wWAUuNkJaq1qmTLd0tj1xwCGEr5ACUGHTEnv7hJES+rK4QeVEYp2NisN9BxFCkJrYyPvHKAsuCaNk3aq6798=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731424985; c=relaxed/simple;
	bh=b1/oli2eNGVHnuEhtpLxljO513Um5Nc7g/KpwtT5fAI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Syt4UtbRilb8e+Xbow5m4MnX0hME7Yb1KFOrcRoXHkx3doNGDaxk/bkDsHv1pbYYsOwpwppiaBjoa6OmjO6QkUls6l5WaWevciWb9fDvzTxtEtsykxMimQJ4kjWiNpNz+GKN5j+QsDnyUypmcjmhPsjYWyFqYZGq+ou4GRzsURE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FEKMNAZP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FEKMNAZP"
Received: by smtp.kernel.org (Postfix)
	id 3B5DCC4CED5; Tue, 12 Nov 2024 15:23:05 +0000 (UTC)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5F3A8C4CED0
	for <tools@kernel.org>; Tue, 12 Nov 2024 15:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5F3A8C4CED0
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539e3f35268so6413882e87.3
        for <tools@kernel.org>; Tue, 12 Nov 2024 07:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731424982; x=1732029782; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b1/oli2eNGVHnuEhtpLxljO513Um5Nc7g/KpwtT5fAI=;
        b=FEKMNAZP1gn3/3SlVAQ7ufjpBB38VNA9Wg4PEN7aaepEdXiDBKEyN12s+a3IbDUpyF
         m8NznFSE2G8u2NibOj+OwbCpQePUN16kuw5iXfcirhxbOD0hMxrwPMcqF+4eMUGUc2Xc
         wLCaJFPmqfnVs+rRNC7NJ6xBjueI9YmkpJsSf56P2ExCwWhnkh/b5SLt0fckvr3CFWsJ
         fpasJqBBUyOX2lRv5ApqKCEMwfucOlq1/jvoIh369p1DTwX/LzhS1DYUptJibZdsPxd9
         nMZkpkukBnl5CqREu2fniD1HlpWqT24uGSpHAkAa41G4KiKmWYsoFVR6frtUY6H/uwXX
         G3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731424982; x=1732029782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b1/oli2eNGVHnuEhtpLxljO513Um5Nc7g/KpwtT5fAI=;
        b=b0dpIsSNzclUd0xkR38jNaxdDIg5SmO4lIXjsU2RbJoYOiBER0UKoEaXs2F6Py8R1W
         4fP3Ks7OdsZsCBZ34vBMhcAh0aDhzVgh7hxK88Wiv3d1OltxTPhirT3SsZtDASWE/pHf
         HsNBysWagjFskbjZwuESYhBbi45Ittu1EmgqG3wG1rGlsCjxJtubcLovCoeA8T4NyzZ5
         mTMNn8B5gXM0Jm6xWXxDc05k8UMv2wYJcsefGiS80nCPtL0xB5HsiyyVynjvlfeJG8fE
         D3WMRBb7FmdeDAj8VlRGavKZweoZ/0N5+F1bFUcqb6ZtbORjJa/IzZ6ZP/WZ7pct6TIM
         PPkw==
X-Gm-Message-State: AOJu0YyEQYNbEKbJWDdoG7yY2mTFfABpferr05NG1A9mZkci41V2FBiu
	gJIPq2r4BDHI3WFkiuTi+d3L3RRqq6L6Bsz8QiTmozJHWwAjSGhue3VPgXjb8gbMrWTQfS5OZuW
	aOZNmCLftsFnPj5Gk7TLKa/dYDrS9RFh4
X-Google-Smtp-Source: AGHT+IE2wF5BlGI0Wz1ZeICqoNUPPTN9Iar2awKQ0cM9F3IJ8B6HkV7nfPIOPSJIkYcsdwf4gVaMzXLo48jAeCP38O4=
X-Received: by 2002:a2e:a98c:0:b0:2f7:a759:72a7 with SMTP id
 38308e7fff4ca-2ff2016dabfmr73640561fa.22.1731424982210; Tue, 12 Nov 2024
 07:23:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAJ-ks9=ztzVopy2w1ggR+-xAyc_CigGWKn4vVDy1sWoMQUUaSg@mail.gmail.com>
In-Reply-To: <CAJ-ks9=ztzVopy2w1ggR+-xAyc_CigGWKn4vVDy1sWoMQUUaSg@mail.gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Tue, 12 Nov 2024 10:22:25 -0500
Message-ID: <CAJ-ks9mo4NESU9Pn9LQqD_39OiLUr8bah1VRke3XUp1XFzPR4g@mail.gmail.com>
Subject: Re: b4: b4 send --resend doesn't provide for updating stale email addresses
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 25, 2024 at 4:57=E2=80=AFPM Tamir Duberstein <tamird@gmail.com>=
 wrote:
>
> Hello, thanks for making b4!
>
> As far as I can tell, it isn't possible to replace an email address
> when resending patches - this is a problem because people change their
> email addresses. I ran into this problem recently[0] and had to use
> `-o` and manually edit the resulting eml file. Passing `--to` allows
> adding recipients, but not removing.
>
> Perhaps I am holding it wrong? Thanks in advance for your help.
> Tamir
>
> [0] https://lore.kernel.org/all/20241019-checkpatch-fixes-commit-v1-1-0d0=
cde18ce69@gmail.com/T/#u

Hi Konstantin, gentle ping on the above.

Thanks.


Tamir
