Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D780112B6C
	for <tools@linux.kernel.org>; Mon, 28 Aug 2023 13:48:24 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-d77a4e30e97so3087347276.2
        for <tools@linux.kernel.org>; Mon, 28 Aug 2023 06:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693230503; x=1693835303;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blhUfqzVF8tP8mpgksXjcwth+y21tfThEGRNVYSwGqo=;
        b=LFTiyvCuBjYi7IFZAeZtDTbPT/8sMhQu2Y8nhYDBa+C8/pfYjFwSPLJ3FzqzMIQMZS
         hTY1rCdnL2+5UOdLxgS8tgvvGEZOKe/xqtPbEtfM+W2ucTHWYW2+TOSGkrIbWyEONFht
         D54/aCf/QnXld+fUIqojo32T+lWIFoiHqiB4tQC52ZTMD0B/MHFX9cZfOLQkGZCZjvU5
         dX+xP01hyUHN3n/uJU0Dbs1yhY0IGbCjbgjRayq8nsPQMMRPtuwHN4ZnJMzH5zMuRd/T
         w5JvPk2souKxmHmdqHpKMHzv6sMgRlWsuZgVjkFT/VRpZAJi6kSPyM9o3nISxsVcXNOT
         6EwA==
X-Gm-Message-State: AOJu0YxM6q0oAvdElltAjIgtKeO6jrV1+GpDswtZxxd/41NxZzhG5i+9
	5ADwbdu5lddOtTORloPuCv3mrfJeBDB9Hg==
X-Google-Smtp-Source: AGHT+IFQnKUoTWygk2DdKlMH8maIBfpWdfr51P+UV1GmU/RBkwxgmLwaGIJ3Z8ogmaUNfPJUIRd/4w==
X-Received: by 2002:a25:1054:0:b0:d7b:b3f:e101 with SMTP id 81-20020a251054000000b00d7b0b3fe101mr3507498ybq.8.1693230503504;
        Mon, 28 Aug 2023 06:48:23 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id y34-20020a25ad22000000b00d6861b49f01sm1663961ybi.65.2023.08.28.06.48.22
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Aug 2023 06:48:23 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5925e580f12so38237547b3.3
        for <tools@linux.kernel.org>; Mon, 28 Aug 2023 06:48:22 -0700 (PDT)
X-Received: by 2002:a5b:b06:0:b0:d47:8db3:8bc8 with SMTP id
 z6-20020a5b0b06000000b00d478db38bc8mr26525998ybp.21.1693230502647; Mon, 28
 Aug 2023 06:48:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
References: <cover.1693037031.git.quic_gurus@quicinc.com> <141b9fcab2208ace3001df4fc10e3dfd42b9f5d9.1693037031.git.quic_gurus@quicinc.com>
 <87jztf37ny.fsf@intel.com> <20230828133554.GA818859@hu-bjorande-lv.qualcomm.com>
In-Reply-To: <20230828133554.GA818859@hu-bjorande-lv.qualcomm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Aug 2023 15:48:11 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU+3oj+-3=f5WFVTRsKQjqCpU8SnVqKSZGk8XRxhsDcVQ@mail.gmail.com>
Message-ID: <CAMuHMdU+3oj+-3=f5WFVTRsKQjqCpU8SnVqKSZGk8XRxhsDcVQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] scripts: Add add-maintainer.py
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Jani Nikula <jani.nikula@intel.com>, Guru Das Srinagesh <quic_gurus@quicinc.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Kees Cook <keescook@chromium.org>, 
	Bjorn Andersson <andersson@kernel.org>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, Will Deacon <will@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, quic_pkondeti@quicinc.com, 
	linux-kernel@vger.kernel.org, kernel@quicinc.com, workflows@vger.kernel.org, 
	tools@linux.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bjorn,

On Mon, Aug 28, 2023 at 3:37=E2=80=AFPM Bjorn Andersson
<quic_bjorande@quicinc.com> wrote:
> On Mon, Aug 28, 2023 at 11:14:41AM +0300, Jani Nikula wrote:
> > On Sat, 26 Aug 2023, Guru Das Srinagesh <quic_gurus@quicinc.com> wrote:
> > > This script runs get_maintainer.py on a given patch file (or multiple
> > > patch files) and adds its output to the patch file in place with the
> > > appropriate email headers "To: " or "Cc: " as the case may be. These =
new
> > > headers are added after the "From: " line in the patch.
> >
> > FWIW, I personally prefer tooling to operate on git branches and commit=
s
> > than patches. For me, the patches are just an intermediate step in
> > getting the commits from my git branch to the mailing list. That's not
> > where I add the Cc's, but rather in the commits in my local branch,
> > where they're preserved. YMMV.
> >
>
> May I ask how you add/carry the recipients in a commit?

I guess below a "---" line in the commit description?

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
