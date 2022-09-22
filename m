Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AC12560
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 22:05:26 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id q11so7176797qkc.12
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 15:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=VQdP5tfJw6Vr8zPPaRRTU9aAgpwDl98cySijmuuA8/U=;
        b=LiKbEnV7tgyBpa2giJWn0ym1A5qL1q999zVUqMOifeI88KOq7hAIB19cBnuCo5/2nI
         OsvvIIRrsB/kxjCYWqRgVL0l0fnRhnf5CYjy9myFjXrIo07Lrpts3XsYuHZNPy2bq3Qm
         IiVE7OHVLQX3Mfo0gyvVBcflUtfDzEPzSPgF8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=VQdP5tfJw6Vr8zPPaRRTU9aAgpwDl98cySijmuuA8/U=;
        b=Ceuuzi0dzPAy4aoh1/GQPJpFYL9cXNRzoN1F0rzulIfPetH9RQ4Ao/xcfhZ3Y1HwjL
         7s7yICdG6GVR6Bvtd6uvAbeThoNduKg38ax+oJ/giJ9xrxS+koM1mpA5a9WNf/ZTMiuq
         QF0i4euJ5SNzwJX/EDQZYfOffIDUL8CE0IvNkO0EsNjerHsqDpexCunPmamNxuQRYmAs
         b9wE64Ce5ZgOxi1GBlPzQGev9RxTmx3frcECm5mrjHiIgE0QZrLK1zW7pOsXfRvKpURc
         ei4A4iP5GvdS2CNx2tv8HRmygQeEdmmZtqnE0wtBzJTr5kcD/4RcAslZjtZS99ioG442
         DXBg==
X-Gm-Message-State: ACrzQf2+MPhiD7raYnjvDcQ4FH43JI1b8B/6h9QMh5ex/aBiwtePrikE
	c/k5kRdK1Pre2kF2rEHuBi7DAIiuXGwlig==
X-Google-Smtp-Source: AMsMyM6W2/igQM8d7ZEssvR60L2Adk/f3ZEPliQFDgwXqsJiJc+sET5ke0Ny3C7L4HKET1NreWJmgA==
X-Received: by 2002:ae9:e217:0:b0:6ce:21bd:a03f with SMTP id c23-20020ae9e217000000b006ce21bda03fmr3553692qkc.765.1663884325430;
        Thu, 22 Sep 2022 15:05:25 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id bm17-20020a05620a199100b006c73c3d288esm4743480qkb.131.2022.09.22.15.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 15:05:25 -0700 (PDT)
Date: Thu, 22 Sep 2022 18:05:23 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: "b4 trailers -u" chops off patch subjects
Message-ID: <20220922220523.5lwelntnjvma7tgt@meerkat.local>
References: <YyzWI/zCGli+3UcQ@google.com>
 <YyzW46WQ47HUKTSx@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyzW46WQ47HUKTSx@google.com>

On Thu, Sep 22, 2022 at 02:42:59PM -0700, Dmitry Torokhov wrote:
> > It looks like "b4 trailers -u" removes patch subjects from commits,
> > leaving only body:

Yikes. This is fixed in master/stable-0.10.y. I'd just introduced it earlier
today due to a refactor. I need to add this to the tests.

Thank you for the report.

-K
