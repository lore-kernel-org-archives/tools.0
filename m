Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C8E3D8E
	for <tools@linux.kernel.org>; Fri, 28 Apr 2023 18:34:34 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2472a3bfd23so203531a91.3
        for <tools@linux.kernel.org>; Fri, 28 Apr 2023 11:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1682706874; x=1685298874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvBl2+0ut4QIjmx2Y6RzSVrm/OIDGdOIfENgyMpwZhw=;
        b=4aRzS98gyj/F1aFPdc1FWAXxckbQYZg4xd86oMDliWycObdKC6ZAsoPqxKLsuYpe6S
         lr+bokmRPl/tkrfOjxQYq0rUMIBVbrChfjIc+8YgVJu36O+DQmyh8X5qWCOkY/dIC7SN
         eplPsowpcBWAA0PwhJ14NQYvvtz5iNsfAI5l9WddjL2gUN9f6VEgfuzFjV8jT3m+QQfA
         w3rwYfOiFjbGJnvxfITME9CkTUdBuy4hWSTQEXhT7jI7MnJBDZ/0vKwBX0r6U5QwTVBs
         1JYqEcaBtD+3XowYQg+BkH6j9pEhE8GvMB97Go1djwBaWz3nXNY1mReG+J2jH5yRCs5O
         YEZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682706874; x=1685298874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvBl2+0ut4QIjmx2Y6RzSVrm/OIDGdOIfENgyMpwZhw=;
        b=gPUoThyKqjoiDTdVrueOkj8MnTJ4dYxeioGB8hwKnMIJD8WqqxR4S4RrH2e3lhqtMv
         fx8peCnlu15cctZ28Quu75DbWuecHV3zc0oV+f65kdySBP0abeku+BxmKgtG6u+XuScT
         xzU63+TbCJBFC7gMVTYjwed/omoObYqp37H+87qKsQK4DrdR+HVS75cSmc18XU80BuED
         YJdPw6xwkcBUW4E1FOjqcOnZxPBmtyNcvpJkraE7xoo01NH+/NfMBFkJrx1iDLWjsxOU
         AITK7/FRMQ7GWZ/xMa5Ad/MMJDWIocwVGosEtzJknycqK/aeNIZUp1oO/+NxzWiqGOZg
         5Gcg==
X-Gm-Message-State: AC+VfDwh8V9qaK2tTp/ei/knsKWHalKidjb+5XwOdEE+TTeaSEaHDsC4
	Q2rmCnpjn3bA5vRL3KBVr0IzkTK9gfO6CF7D5pvy6g==
X-Google-Smtp-Source: ACHHUZ4YMCvvsYHdFhosFIVqTjztx5rQooDtfP04MIckyQMcNZG6K699I1fEhTbONpPsRwPGseNhpB5KZ+3LWFZKcDc=
X-Received: by 2002:a17:90a:e146:b0:23f:5fe7:25a1 with SMTP id
 ez6-20020a17090ae14600b0023f5fe725a1mr6261832pjb.13.1682706874015; Fri, 28
 Apr 2023 11:34:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAKwvOdn6_J+9BppRbXEtDc8CW-qqoat7VJ521oWnqXCXHb_d6A@mail.gmail.com>
 <20230419-closure-polymer-f7a6ac@meerkat>
In-Reply-To: <20230419-closure-polymer-f7a6ac@meerkat>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 28 Apr 2023 11:34:23 -0700
Message-ID: <CAKwvOd=h2TeX6_WqHtK8Tf1MqmOB_ao+JfJpnoSmwXUB0qkaug@mail.gmail.com>
Subject: Re: executable sendemail.smtpserver and b4 --reflect
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: icon@mricon.com, tools@linux.kernel.org, mjg59@srcf.ucam.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 19, 2023 at 11:30=E2=80=AFAM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Wed, Apr 12, 2023 at 12:00:09PM -0700, Nick Desaulniers wrote:
> > I also noticed that my name wasn't being sent on the From: field to
> > LKML. I assume that's an orthogonal issue, but is there anything else
> > I should be doing there?
>
> I don't think it's b4 that is doing this. I think Matthew mentioned that
> sendgmr will rewrite some headers to match your internal authentication,
> perhaps that's what is replacing the From: header?

I see:

$ b4 send
...
Sending via "/usr/bin/sendgmr -i -f ndesaulniers@google.com"

Should this be using `/usr/bin/sendgmr -i -f 'Nick Desaulniers
<ndesaulniers@google.com>'`?
--=20
Thanks,
~Nick Desaulniers
