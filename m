Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D9748E
	for <tools@linux.kernel.org>; Tue, 20 Sep 2022 18:15:42 +0000 (UTC)
Received: by mail-qk1-f173.google.com with SMTP id x18so2245026qkn.6
        for <tools@linux.kernel.org>; Tue, 20 Sep 2022 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=HVMDrhO1DWCiVi2M14BJlQUwxduhDI4UuS4IAbs1V3I=;
        b=F50WZviKdT0DQt8h9pejuLR7fGqUbRZlJrcrOQsYst+RwUGVMNK0v1nDSBq/yYstuO
         QApJTSPrfoo03+9mRc54YagB/hEAbIaKO/4WfhYF7XFo21IFLSRZlhHqRPqiM6ni/JbS
         6pZvuReDk5v3bmLin1tc4LLE0Gj2BS+nXK2Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=HVMDrhO1DWCiVi2M14BJlQUwxduhDI4UuS4IAbs1V3I=;
        b=4uKbkPrh984eTjXNArhnVrPw/7GKRmyXkQxIKo/thxgfb711VuITrOJUX5dX7JPAPo
         7iNDUCuy5nmhMAIuOHvqHE7MW4mBmV5HW2BTiowtTmYqCs1mWNpgnb1q+QUTJhsqavcB
         QAr+7B1lZOZA+UvlRpcE4biFtQqOXln53ZohbNjx6Ck6m1NeZ4+3grfI6szYLMjhpFLq
         agxehZLzgRAVyexr6eJqXaWW+SaiwPed4yUStsQZSulUGEvZZy2nxctSnotr9WHRe7B6
         bsThOQG7dO6V7jITwwmktsJkKDbsR7q2SUA548tIkhwTj5e/1399ZSQVSBUOYbxDBf23
         V1Ig==
X-Gm-Message-State: ACrzQf0o/OniyppW0+bmJW+roQdqglqSUX91H9pCwzvo+QmB1AobN8iC
	PvzTYzyFMkTx533g8OceDZXD2g==
X-Google-Smtp-Source: AMsMyM7mWqUKa1VNPwwbSiJziOkzyvXK+RhupM+VmXP/tMVec65vfEmoPaaw6f18n8iyzI73T0VOWw==
X-Received: by 2002:a05:620a:1a0a:b0:6ce:bd2c:d32e with SMTP id bk10-20020a05620a1a0a00b006cebd2cd32emr17493898qkb.756.1663697741033;
        Tue, 20 Sep 2022 11:15:41 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id dt9-20020a05620a478900b006cddf59a600sm300214qkb.34.2022.09.20.11.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:15:40 -0700 (PDT)
Date: Tue, 20 Sep 2022 14:15:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <20220920181538.3pswzay3ewbpu6z5@meerkat.local>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
 <YymDlmJG8fNhvHSY@unreal>
 <20220920144855.bxe4qtmibbu472rh@meerkat.local>
 <Yynz6A51ULumuBVJ@unreal>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yynz6A51ULumuBVJ@unreal>

On Tue, Sep 20, 2022 at 08:10:00PM +0300, Leon Romanovsky wrote:
> Thanks, it fixed the splat, but I still can't send emails with ty.

Oh, I see how it is -- it actually expects recipients to be on cmdline, not
just in the message headers. I think I have it now, please try master again.

> BTW, git send-email ... works well.

Well, git-send-email is a 2000-line perl script with lots of really
questionable decisions (like supporting paths for an option called
"smtpServer"). So, full bug-for-bug compatibility is hard to achieve. :)
Thank you for being patient.

-K
