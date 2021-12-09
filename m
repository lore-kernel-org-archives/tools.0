Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED60768;
	Thu,  9 Dec 2021 21:59:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7E19C004DD;
	Thu,  9 Dec 2021 21:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639087195;
	bh=H62sVJXEC7rcJL8n0ha/dgj407P9hYHXCaeZ3FyxPnI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Szc5lhnNxCkV2wSgp6jboSprNjGeYDa21l4DqYBSjEEwah2MjXAywIT49DRiQ/Kbc
	 Q8qY3bbOqqhIeWD2FHWhDETrjcntdKytSbvINKQqeDOxlsuUrKks1C2+GhfWnTd79T
	 hZ59Bwg9ewbE05F2ezW0aIC5ZYR2Ys01ofTEQQ0LM9HqAWq/a88/Mni3adX8tlVk6e
	 cq+WLTx9Y4Yl3ceRElFB+61tpvnxibQOfCAPf7HHSv2+WKZWoxuZfIDBFPac7IiCfq
	 LY7FYFvdvbsWgQKsqb1I4pHpUodpneL0Eronj5qKwAppoJ9k/nFA8QerXX9l00mo8Y
	 AY5anQlQVmyJw==
Received: by mail-ed1-f41.google.com with SMTP id y13so23701894edd.13;
        Thu, 09 Dec 2021 13:59:55 -0800 (PST)
X-Gm-Message-State: AOAM531GcAaAlGdS6QM+7+icOB5eYVE0scrtbQBHz860RxhKmYCItHs+
	rxuJet1UqbLTUaYIZqC6L7A/DXiuKP9nvQHUQQ==
X-Google-Smtp-Source: ABdhPJwyEYBfvtP+8X8kRmYwS3pUZgZan4CYaTQ2AEuNJcyPqJPwoTzrxLJEtmbcHeG991F2GsRMsnqbvUznLxMjnic=
X-Received: by 2002:a05:6402:84f:: with SMTP id b15mr27602752edz.342.1639087194038;
 Thu, 09 Dec 2021 13:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <CAL_JsqLgO5a282_w=gj1sjegTuwCchnUaR4TtwLX4JDLEkd29w@mail.gmail.com>
 <20211209213146.h7r2a4iaba7qd27j@meerkat.local>
In-Reply-To: <20211209213146.h7r2a4iaba7qd27j@meerkat.local>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Dec 2021 15:59:42 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK_eX=aKtRAfeXqLY8EgisnMJ_BcgpSM-vRFr5zRk0DSA@mail.gmail.com>
Message-ID: <CAL_JsqK_eX=aKtRAfeXqLY8EgisnMJ_BcgpSM-vRFr5zRk0DSA@mail.gmail.com>
Subject: Re: b4 splat
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@linux.kernel.org, users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Dec 9, 2021 at 3:31 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Dec 09, 2021 at 03:08:52PM -0600, Rob Herring wrote:
> > Hi Konstantin,
> >
> > I'm seeing a splat from b4 on this thread. I briefly looked at it, but
> > don't see the problem. The email looks pretty 'normal' to me.
>
> We definitely shouldn't crash there, but the submitter indeed managed to do
> something very strange:
>
> Content-Type: text/plain; charset="y"

Ahh, when I add a print of 'msg' before the splat, it's just
'Content-Type: text/plain'. I guess the object's repr() method handles
it.

Rob
