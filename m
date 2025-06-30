Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9DA0FC1D
	for <tools@linux.kernel.org>; Mon, 30 Jun 2025 09:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751276378; cv=none; b=MPhY56O4CTDl0aRMnUxMG2KVKAimPcjilYwwqZa32QjhvrGwFUJIazMc68SeyMUfMYHKg0ZkepdwEhR/76ZJBUkeo2pZgdLiZ4yq/kp2ie7o129AViPKbzdDBVb9s0AnmGvNYNPGgAg1EKZ8mfdA1o5rHoPyY+/3MIz29Vsy0rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751276378; c=relaxed/simple;
	bh=5LMQu7tbreO/twRfx5Jmd3eEf4zNjxbyePRBgcogo64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZR3EKWeHpbNXy3uy4PvFLcWVMWEVRUdVRQcix0LOde0iWogJyV6SLWvHyrumENflHuU+VJUNJ9bVPfEoQqqq9MEw4veYaHczIdo/UR6no1cztvMEAIEAcnzzKrxfYFPFblbyIem6hCor3XDAQ7/Mxm9a2SXflIv+n+MwvVuJL6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l6NCNap6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l6NCNap6"
Received: by smtp.kernel.org (Postfix)
	id 50FC4C4CEEB; Mon, 30 Jun 2025 09:39:35 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8854CC4CEE3;
	Mon, 30 Jun 2025 09:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8854CC4CEE3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ade5a0442dfso811311066b.1;
        Mon, 30 Jun 2025 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751276373; x=1751881173; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5LMQu7tbreO/twRfx5Jmd3eEf4zNjxbyePRBgcogo64=;
        b=l6NCNap64J+TeR69Xsj0TLIXOVjAGfe57mwJoa7LcrFIF0bbCRkgp3cKQQNgtNXzM7
         R6BLBdujYETIbm691utHwhvx2hv2icK9q9kqTgf/1H4EAODh4X/3p6CD8qKXotEiwXbw
         Q4QykS1J4xHrtYhBixdxm6f0zELQS6t+KNjzV2oPsTNxq+u3o7wy/Y9gW4CN2Gl2mW0A
         b5PI0HjOloYIxp3gSSRDaIEpYiAQK6lZjynaU+B6HaLto8uuEg/iMbqCPcsYTK/K6h5A
         20AmvVW1p58tls+EayIhOs0TaGvwQMMYuSIJNaALZWqrFx/lYZ5UntgwkIgRrTi0p0Yn
         rA/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751276373; x=1751881173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5LMQu7tbreO/twRfx5Jmd3eEf4zNjxbyePRBgcogo64=;
        b=iAc7ZHy6FqlaHF9BTiaouThRe63CCHDnANijq/KnmDd2CLdUe6LrBJEb7U+dp/hJdf
         xxE05S2Ys1p8PVcDaIjG7eELIUmnzCPcqS1rk2WCU6C6If7NssOZ2L7e39lnb+g5xIyQ
         wFSu6jtfWpdUVfJYka7cg4Nlaw4WKStb8iBonsswjgyuBNLBHYeJ3tJSDz2MFNaCLAwM
         msQRWGTqkVNWGoeckuAjQea/IXEY4cdueBrcs9VbC0x2TDBoVHn2tgo88b7awyiohy/P
         XNrZHaZYHi5KnPB9mQWhhLJgEYgPjS6ZurXpsRYB3MszQ8dSf/ISCmloNMwFRlrnOBkr
         nNPw==
X-Forwarded-Encrypted: i=1; AJvYcCX9M5kLOYwyoVy25pHd2XQzQuJ+zeZU5r+x8+q7XTBUpUkYJE4ZwDCPBySeeptyNstszF81qw==@kernel.org
X-Gm-Message-State: AOJu0YyO13I5mATfvYo/SNrucamSa9REmR8QzAKiktVYDmnPfiBMu9Px
	G2/6o2gRKwEhZDBXOkEKA98ncwVmHhvY033CKISwqNSXqh7SOw127cnBFp2TN/HgkUWEjTp7Uod
	gN8OUWG0wn9jQzGL4phPK5Fb406bxhE528Ukx
X-Gm-Gg: ASbGncuZRsutK0+fGYsvcIT/U9SDkzQcz3zRI3PDLsnSZ0mZiqg76mvVfvcDHXg6bAp
	OVb61DU0IK6rxqBbPvibqY2kxrzIFqCVyaFC52cOG/auHjbC/uGJ7xViA3NTafMx3gTHdKxMcg7
	F4YBaKb/3/lE0A7UfEZVRtXtAa8eEmESlsR+OK7+hp/w==
X-Google-Smtp-Source: AGHT+IE+UMThiHJtZL0lOP2YWNO/1j0kaeNXGaIauA3oPlhiTM0flvXcli0CWbyn53HbSAaAoKgUmPp6AccfRBPYTpo=
X-Received: by 2002:a17:907:608d:b0:ae0:bf55:5c47 with SMTP id
 a640c23a62f3a-ae3500f1f0fmr1087942266b.33.1751276372446; Mon, 30 Jun 2025
 02:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAE-h8tF9rp1B22YhC6PPUFntst9BEZzcCiyy-Mzjq2pQwEnAgg@mail.gmail.com>
 <20250627-b220285c2-29e8ccff3223@bugzilla.kernel.org>
In-Reply-To: <20250627-b220285c2-29e8ccff3223@bugzilla.kernel.org>
From: Juri Lelli <juri.lelli@gmail.com>
Date: Mon, 30 Jun 2025 10:39:21 +0100
X-Gm-Features: Ac12FXzWtjmTxvsJ9c0Imtjdymo4JejFGGawMxCO-bNmQlrYFlYYs_xgND9JjWE
Message-ID: <CAE-h8tGpn0fG6PyXSaq__ekGMhPnJWKO1dHz5mH5LaUEq-ybQA@mail.gmail.com>
Subject: Re: b4: Fail to send series with smtpAuth none
To: Bugspray Bot <bugbot@kernel.org>
Cc: konstantin@linuxfoundation.org, tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Fri, Jun 27, 2025 at 7:09=E2=80=AFPM Bugspray Bot <bugbot@kernel.org> wr=
ote:
>
> Konstantin Ryabitsev writes in commit a9b2aba54be85ea2933c43b8a6d71c16112=
30b59:
>
> Support smtpauth=3Dnone in sendemail configs
>
> We still don't support the entire range of all possible [sendemail]
> section configurations, but it's easy to suppor the special
> smtpauth=3Dnone setting to not require username/password.
>
> Suggested-by: Juri Lelli <juri.lelli@gmail.com>
> Closees: https://bugzilla.kernel.org/show_bug.cgi?id=3D220285
> Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
>
> (via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=3Da9b2aba5=
4be8)
> --

This works like a charm. Thanks a lot for the super quick response!

Tested-by: Juri Lelli <juri.lelli@gmail.com>

Best,
Juri
