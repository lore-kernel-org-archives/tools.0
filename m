Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9818480;
	Fri,  4 Nov 2022 17:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A664C433C1;
	Fri,  4 Nov 2022 17:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667584077;
	bh=+Xz1OWqtNs9KrQ53tuZj2tbgO0rgflGdRS5NcxSpMfU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ec/Fln13r+TNvX8pR6Ysml2+qlHTSFhJg3/ejO/PhSpLVKP5I6rOQ2mleLFvdCqDJ
	 qgE08JLBLCGySnzFGL7JC4j8jSqt26ynKecgIb335jtcwLEKLDQo4yeYq4bKZUnWCw
	 BfY+FG3uCALa+GpQpptZ/e5NrT2zxBOW2KQmH0+11XaNImdOOysAfDZ9UAKz54Q/XQ
	 1WKToPuGs54UMn6ThDUhzL5aeCrGbJ9Yn9XRDIqOic2kxkaMnnYgSW5NieQTbA5xxe
	 Gk1c2FHEkMUvMvYSiD3gt0TJtVfMTWr3mz8sSIUyHJ9JB892w2N9PFkPe/CCzFrIgX
	 IDam/4DYcTSmQ==
Received: by mail-lj1-f181.google.com with SMTP id s24so7394164ljs.11;
        Fri, 04 Nov 2022 10:47:57 -0700 (PDT)
X-Gm-Message-State: ACrzQf0eEjTt1hWEV34rTGSxaM9Hy7Ybipykyus+2Fb+7tzJohDgwpOy
	eIW+JyETSCE2KViIFzJPg4+J1yQxHySBhI9Gaw==
X-Google-Smtp-Source: AMsMyM4rom9OLVqtvx/ENBvgkeCe3E11HAHFRVkq0b0d0e7172/+yB+KCMGnUjzEqE+6iO76Edi3cVkPGnUgKY77hZ8=
X-Received: by 2002:a2e:8ec8:0:b0:277:438:2e97 with SMTP id
 e8-20020a2e8ec8000000b0027704382e97mr14207236ljl.215.1667584075219; Fri, 04
 Nov 2022 10:47:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <Y2ScVwTlqH/zz36J@google.com> <20221104171340.ilq22prnm2kbyjrn@meerkat.local>
In-Reply-To: <20221104171340.ilq22prnm2kbyjrn@meerkat.local>
From: Rob Herring <robh@kernel.org>
Date: Fri, 4 Nov 2022 12:47:46 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJHGUMsLUpH=s8Xa46NU9dbBuvPMCPJyRwQdvFr3WK9tw@mail.gmail.com>
Message-ID: <CAL_JsqJHGUMsLUpH=s8Xa46NU9dbBuvPMCPJyRwQdvFr3WK9tw@mail.gmail.com>
Subject: Re: b4 prep and --manual-reroll
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, tools@linux.kernel.org, 
	users@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 4, 2022 at 12:14 PM Konstantin Ryabitsev
<konstantin@linuxfoundation.org> wrote:
>
> On Thu, Nov 03, 2022 at 10:00:07PM -0700, Dmitry Torokhov wrote:
> > Hi Konstantin,
> >
> > Somehow "b4 send -o dir" followed by "git send-email ..." managed to
> > produce quoted-printable cover letter message (see
> > https://lore.kernel.org/all/20221103-omapfb-gpiod-v1-0-c3d53ca7988f@gmail.com/)
> > and that confused "b4 prep --manual-reroll ..." as this produced a tag
> > that had "=0D" as line ends. I was able to work around it with the
> > patch below (not sure if this is right thing to do)...
>
> Ah, yes, quoted-printable is the bane of my existence. Thank you for reporting
> this. I think a better way forward is to get away from get_payload(), which is
> a legacy method that I kept around when we cared about python3.6
> compatibility. I'll comb the codebase for a better solution.

FWIW, this is what I use:

body = orig_msg.get_body(preferencelist='plain').get_content(errors='strict')


For sending replies, python prefers base64 if any encoding is needed,
so I do this:

    msg = email.message.EmailMessage(policy=email.policy.default)
    charset = orig_msg.get_content_charset()
    if charset:
        msg.set_content(body, charset=charset, cte='8bit')
    else:
        msg.set_content(body, charset='ascii', cte='7bit')


Rob
