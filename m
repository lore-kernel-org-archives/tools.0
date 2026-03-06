Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FCF315D3E
	for <tools@linux.kernel.org>; Fri,  6 Mar 2026 01:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772759738; cv=pass; b=jpLORgJoKxnhDFj/gBNLXQ/SwvUlrmTCFJifHKwEdDva5cc1QwMyZK28oxqLMkCWx1jRmUF32tqPCHJrnI9MICqjwvY/vv7hJh3LSlJJMVOvecfXFzFIOoVukagtknKxFe0hU//SyPNMXPJdQaPKy9WLvs9IldXbietMunbeMv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772759738; c=relaxed/simple;
	bh=uuIWa9AO+qMtjskA7ozO8v1r7ndsR8PrrHmwZkQbcak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOWEDq4jRXAHZT7uHJUkOhzBFCC4JJ0TL1SJG5YWR71vMrAcUiE8jr6B9g7efxmFGc1PEgVIFnRDo0ktavOGVGzTbSCGu1qzjL3ueemtclmActEAyrCc4rqXWrr+IoXwQzshokV+EzCSCQktC5/9x3ktenzARNkno15zhZGQmVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m1mtO9Tz; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m1mtO9Tz"
Received: by smtp.kernel.org (Postfix)
	id 01877C19423; Fri,  6 Mar 2026 01:15:38 +0000 (UTC)
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 509A9C116C6
	for <tools@kernel.org>; Fri,  6 Mar 2026 01:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 509A9C116C6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1277863a912so625343c88.0
        for <tools@kernel.org>; Thu, 05 Mar 2026 17:15:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772759736; cv=none;
        d=google.com; s=arc-20240605;
        b=Br8mOd+nhnHmK4CJtFGNkwpmw8mgDSiFrs6LHjQ9yh7IqNsKI5FgCPZ6mh5sXROOIR
         afSCHcF+4UoHWlDT5b4+84QQ3sSP9sMLPtAV+dDW7hGmNDkrLGB72LPqZOLxjHJyOHM6
         1AKKG3q6zZLv+fXgyes3E2yiq0PnQV8jfrq5LVV5ZJOitRB6hphVSQ9NlxhSwrle60G5
         NImgLUDvfc7eECFA90T6Nogdc8zOhsuFKtdOeOJaqLZXMqC0sJZAIoDZxFO0qgGS4pJT
         GG1FN7aDsDM0VheAfP1XXe8qCNSX5Zp0HuaiZ+aY7ZyRxp4LkXcQEh7tsokkl1WrWTc+
         GHfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uuIWa9AO+qMtjskA7ozO8v1r7ndsR8PrrHmwZkQbcak=;
        fh=pVFCmUlzpJpXeWL75YEUublKX0FktfRVvriFFx461zI=;
        b=FbLhWA8xhW/g+zn4oGf6KhRdnMH8ZTpRA6kahhojOury3R/RcZp/lQsFBa+Bb2lNjX
         P3Db6Y4nL3C1imc86dY3IgSZBZBqKpI/ELDJKQvQm0zyNcRLb2kkB+ymODlxs4ElfjNk
         5S63mYe+9Cr5oQTH1xgYSNkg7sIJvEl5/7cEQ9ZeHxLgVPpchw9/nYGNWUr1ltDuh29g
         iDpKrBOVoPnmLNoae16nXOUBm6CdmnfcgE+wpXKAAkXkcRlbdx5ICxMljRTLuGUD5ESV
         Eh/4nJ37uhY4hfIJpgtMF22VhsIJdYHZugQ+tOcRyW3WVpSGt7EO1XvbF0qWQP8cFS8g
         7HWA==;
        darn=kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772759736; x=1773364536; darn=kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uuIWa9AO+qMtjskA7ozO8v1r7ndsR8PrrHmwZkQbcak=;
        b=m1mtO9TzJ5v7CmE2HfEX8gHQwu9PDlk26RfqTtwiaU3YBbmf47f0BnUjAI2mYsJhG2
         R+97ynacc4rBmnDG9Kpe95CPbCWq7Egm3Ta/XnpC0lAYs9UrxSvaeJnCBE1Gtg5/f4nv
         qzVF6xY04HH5DEKkvCMZiiiS7gqv/YJjLrU0XCoScMcl/qUiZR2LcE94lc9aMji400mP
         YgbhcV1jvmuIocIZd5z36cDhze3Xf817Gdf70R3DC99vuNJFQHeSse9PIGO1TdcSCRh1
         VkzH6WtN91mKOUTKBQ5YVWpqEvpdk4RFq6updCLY6+H+ZylpG89XJkCDdgXKrWniswgN
         Y5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772759736; x=1773364536;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uuIWa9AO+qMtjskA7ozO8v1r7ndsR8PrrHmwZkQbcak=;
        b=I2+aNeRdNVPxSHAMl6zljobTdBh1n7kKCwcpttp0VqOYkLwM66ZAOfpG7T+lLQaRNy
         xRAAkKLL9INY22CmctXucdtjbpN04gXWl4Tuk0ekB9hEBbji9fR36EwvlM+futl0xV9A
         LxXEb4NLk4IwPZjEE8NI9TA0JF6bfUkyRsDKJjRZFt/Y/VXEdpRvnQN7Z+gsuriZH6AZ
         INY4BXjZXpnXx8Q+jFSyvIskTIfvcA8LBz0XLdimtaGGgyghX5aL32DQesqDnSNjwsv/
         4Dfz1Qzm0CMwvfXilvkAFUNqKn3lTnQwxoMh0YRa8FwquV4fZ7FP7ur3n1KRBJzbN9i/
         22lQ==
X-Gm-Message-State: AOJu0Yx4BaEGMYVYMvZ2zpXton3NLIbjwpnPWpM+JAyJG3G5/F4rusn7
	IzcKJ7NV+pFQfOJK8eLXXh+F4lhcftsiDJGskpZRBfcgCWQwepQeHSd1LpPwyyMECpArDFJfSK8
	GFv2NJKR+niuokDVAweapW4Ta/rTcJNI=
X-Gm-Gg: ATEYQzwJ4VHF0+fTm0MOfTHhsboPyh2WpR7mCrrCOrsaV6ZDlFGf3OvHvl4SuXnmdeh
	56IW1srm5gxiaWcoSwwmVyZjX7d5r3ZUCwGGabxeVV6IR/on4QgC6f7f7fOjIlw7Ys+Y5/VyzwM
	KjwwUFIy/5BMD4yvr/NCcENnczzNp5AcbIgzVj5ewQHT7Qm8i9hruxDBnF+fRm867JH9gQuzPNW
	MXkgblvSowIPAMDzUN0uIIXtlC+CwDsFbwLsV2hp4kNRxT02s0mkDx2NSNV6gQJP20FyYIq9jCa
	u40QarbDKy9KWQ/cLgS+KNOOqsKXu8zWH00JK0RTVT10+RUbXjPooC5b8ZqCViTVAkfrtRKPSuJ
	LTEFTZUQigpmGH6iRtFI+fdddB9NvHLE9OA0=
X-Received: by 2002:a05:7300:af06:b0:2b7:e929:856b with SMTP id
 5a478bee46e88-2be4e0f0d27mr78985eec.5.1772759736184; Thu, 05 Mar 2026
 17:15:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CANiq72nLuYfoVnWGjmEmUJDKSpFJq9wUXfTND1e3cjwhe0KFFQ@mail.gmail.com>
 <20260305-courageous-peach-badger-5edcfb@lemur>
In-Reply-To: <20260305-courageous-peach-badger-5edcfb@lemur>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Mar 2026 02:15:22 +0100
X-Gm-Features: AaiRm52dLeo6ZFjitaF2Mrs6xNqphKTMqZ2BSbpwP9rWSwZoR7E-6DakujssR0k
Message-ID: <CANiq72=usvb3LjF+6OT=miCjiBeYgjf0DKnWA4RqaVjyxS2EAg@mail.gmail.com>
Subject: Re: `b4` drops added trailers with peculiar patch
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 1:58=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> Thanks for the report. I haven't ignored it, I swear!
> (Well, I have, but not permanently.)

Thanks for taking a look! Glad to see `b4` getting more and more
robust over time :)

Cheers,
Miguel
