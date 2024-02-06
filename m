Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44D91BDE0
	for <tools@linux.kernel.org>; Tue,  6 Feb 2024 21:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707253982; cv=none; b=cpMovPK6+sRkA9ZJVWDej66WGF6XLjxIicI+97uu0sJFZVEsgFNNhr1zwNb+cNFqsfM6WfkM2wqOKsyAD2hUhQN8vtW53/RuEsaOE6q5uGPrkS80onQTB0JEDMs/dGxenl/zqOfhoSrZFhQeq32Z/rONZseRBi6w8DXTdxkM/C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707253982; c=relaxed/simple;
	bh=FR59AfeRDBqndWw9GhHcZpL57+t9RrwU9w5hpD5DoCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dBA2A8a1XVYo/ynCXNixAGm9Gt9JSpmS9uYdk8asN3ms6UM5eVwWjvFWKk8E3kqjfyM9W2yJ8CTnaPUypQKpxiy/9WjT/9uLas+0Mc1anxJknnmM6Ojdkrqxz1i6hEf8yfOMZozq6jC1YGNtpSkLRowFHhQXcHGsnhktt0yNhlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=HjWp3GLz; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="HjWp3GLz"
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-dc23bf7e5aaso5920975276.0
        for <tools@linux.kernel.org>; Tue, 06 Feb 2024 13:12:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1707253979; x=1707858779; darn=linux.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FR59AfeRDBqndWw9GhHcZpL57+t9RrwU9w5hpD5DoCU=;
        b=HjWp3GLzlPgZKJ1uNyAIJPnmyOBUyU3PDURRTMdNkYoRMYcvwb+SmEpGpNCz86jP7c
         pcgfktMcTKEJVIOvQ2mpU7cjuNI2cY0W5H1eDsHxgsE3sJ7WZrC+kdwGU1fF9xDU3M8Y
         avYeA1GJ+6Y2MXxPHXanEpklZX+9EHN0/e+ToQaHTIOLV/O3QMHSI3/YHiSoHURsN72t
         KXqc6feAIOWf5h2A7uQ0ou+UVB9fm+E0gFFjdSq7TmLTWNwI0F7rLtvAEU8TNqJSsdUr
         ifynOTo7CYKMGB0HWsqA2bqzeK8PDsfxY0WPRmAJwcTLpvu1pOUMJGFmduteIVhZbHgs
         PoBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707253979; x=1707858779;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FR59AfeRDBqndWw9GhHcZpL57+t9RrwU9w5hpD5DoCU=;
        b=Mym8Hk/8e9FOpYduNj+V1Zya6TEbwfYhSOOuAzTfNuGo09KGHuvH3rFA4JroO0mXG1
         95/mUfeEzXHuoq1HbfFKY9CSYYm9wuGlui2icnnYhiy5L2Qcfgnboiu2jK4i6VOwXa32
         TfXFTI4vUe4MjiWNTIjE35YH11oPLY3dWRox1xOJ+oHtYKDpJxRV5G4onzWTZAuah2ci
         KrW9NaHKehirCu99Oi0iVmGWxUDgEylrnN6k0DQPeZfDXVjYfSiPrnhUtN4pdJKtTZQe
         VXqI2P+qXm8AlB2nTnZh+1KEsRBeC1d2+sTk8/DXF68zpx25VcovuduLzWpod1AUsX/R
         mh3g==
X-Gm-Message-State: AOJu0YxI3Im4C/JiqLb9gtQiJGws2RIq7kNLf9LOx/NTbyDfUYmlI6Yi
	MPdS9FpS9lH50dS2MhIid98SqYuQs9FH99pb+I6ODTi8e4qmB8DWa26mEs5SoZajH9ljpxvOHUf
	kRFWh0jJoofDsBOjNmxOLlODfYwWrf3CTYDfHlgHEX9SW22CQ6g==
X-Google-Smtp-Source: AGHT+IHLng4mwxt/LvkE8uNfT7L08p0cJW8Z/0KZlOjD8UsVlTrfiZuV89oloTBF1KMAG64jphA3glegcmfWQY6CiMQ=
X-Received: by 2002:a25:848c:0:b0:dc6:c098:4bca with SMTP id
 v12-20020a25848c000000b00dc6c0984bcamr3053496ybk.53.1707253978872; Tue, 06
 Feb 2024 13:12:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAHC9VhRCTKD7qwm7u9EvudWkY9nw+CSS1HCOdr5c8OWBU1LCEg@mail.gmail.com>
 <20231222-secret-thoughtful-zebu-fedba6@lemur> <CAHC9VhRTQPAfTutfXQt3yk9267EHdDpSGqE-=GnEAyspSvQ-Zw@mail.gmail.com>
 <20240108-urban-nice-hyrax-a0ee5f@lemur> <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
In-Reply-To: <CAHC9VhRMksB7Avdcy4u8uYtFGR_i1-C7jNDm+wv2X=yykB2NVA@mail.gmail.com>
From: Paul Moore <paul@paul-moore.com>
Date: Tue, 6 Feb 2024 16:12:48 -0500
Message-ID: <CAHC9VhQTVZtY-9VfMunERWnEZ7ReDkYRm07QGsmEYwyU3DC7JQ@mail.gmail.com>
Subject: Re: Problems with patatt and stacked-git's patchset cover letter
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 4:00=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
> I'll dig up a lore archive link and post this for the stacked-git folks t=
o take a look at too.

Here is the stacked-git GH issue that I created for this:

* https://github.com/stacked-git/stgit/issues/414

--=20
paul-moore.com
