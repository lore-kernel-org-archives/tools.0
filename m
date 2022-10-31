Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D232333ED
	for <tools@linux.kernel.org>; Mon, 31 Oct 2022 17:43:13 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id w10so8791351qvr.3
        for <tools@linux.kernel.org>; Mon, 31 Oct 2022 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MQWep9FntwG9QMrEsYJ3ys8y8LWy8pZTXV0IL0CRh7U=;
        b=TZkkBsLtEmU2EO8Nj7ZB96vcsRNZUj/uFqZuN4W78IyNoPTcojoeupn6y103TG51vM
         AIrD20fz+sGW96Rmlq6o+95ZIDjiC1stE+lbCupH2xR2B7bfIKe/DDIMXyh+6qTnk43k
         VTL3esey6ow1ost11S7ifZVVJtL69xDcle3RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQWep9FntwG9QMrEsYJ3ys8y8LWy8pZTXV0IL0CRh7U=;
        b=uWlidGzzEETqUaMUauRE7cDukorSEuykHAhngsesuG2iV0rjVMc7gJJdG1/dWMF+h0
         7rbn2deVDs/mMlNrvK51lfWw1VXRZ1VoR0WX8UgHXVvvxXTxgzoy1IgxF+dnexouSgnb
         +nU2q8lJZN3ygkG7Br/+rFXY+QnmdX9UBuWhTagRfiNbNL6qpGj4BQrsKVGE9zfZbNL6
         86CCV3ZQn7BQA/auFuL9XELM/lQAXgeqiyh1W97m89JAlUEztfXWN5cCjo+wLMbDIL1A
         q9qJ8JFrf7zzANBYyLHoJGZzySolfR0AVq9BAq+Uy4rulp/1sqWyVm2Kerqxz9+XGuNa
         UJmA==
X-Gm-Message-State: ACrzQf1vxNN4ybI0uPwhpor+SZqnC53nOWpeFwQ8b+L3jhtqUa3d19M9
	UUUMENmpdj2v7TzVzjqsKaT4Fw==
X-Google-Smtp-Source: AMsMyM59pfzDUP4X62gBJYfk7YOerQIMaixYX+uI1eSuo7jqtWQMlHkInNDZsz7746N2ILZSP9sS0g==
X-Received: by 2002:a0c:fccd:0:b0:4bb:66a2:d9a3 with SMTP id i13-20020a0cfccd000000b004bb66a2d9a3mr11891421qvq.50.1667238192639;
        Mon, 31 Oct 2022 10:43:12 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id l1-20020a05620a28c100b006bbc09af9f5sm5070635qkp.101.2022.10.31.10.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 10:43:12 -0700 (PDT)
Date: Mon, 31 Oct 2022 13:43:10 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	tools@linux.kernel.org, users@linux.kernel.org
Subject: Re: DCO chain of custody revisited (was Re: [PATCH v4 08/11] mfd:
 qcom-pm8xxx: drop unused PM8018 compatible)
Message-ID: <20221031174310.s2jasivnuwj7xp2t@meerkat.local>
References: <20220928-mdm9615-dt-schema-fixes-v4-0-dac2dfaac703@linaro.org>
 <20220928-mdm9615-dt-schema-fixes-v4-8-dac2dfaac703@linaro.org>
 <Y1/qnCyav/S35mRo@google.com>
 <6858acf3-eb90-41aa-b714-a2ceb6afe9db@linaro.org>
 <20221031165842.vxr4kp6h7qnkc53l@meerkat.local>
 <7b25ea15b6e508f435ca36967d9f4d4408f9a690.camel@HansenPartnership.com>
 <20221031172319.znosu3gleyipeje5@meerkat.local>
 <9214fe10dee071bfc637fe1d90e251aa7f62480a.camel@HansenPartnership.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9214fe10dee071bfc637fe1d90e251aa7f62480a.camel@HansenPartnership.com>

On Mon, Oct 31, 2022 at 01:33:27PM -0400, James Bottomley wrote:
> > But this is where it becomes complicated. The Reviewed-By trailer was
> > sent to the v2 of the series, and incorporated into v3(via b4
> > trailers). If we stick it below Signed-off-by, then it may suggest
> > that Krzysztof reviewed the v4 of the patch.
> 
> If the changes from v2 to v4 were material enough for that question to
> be relevant then the Reviewed-by tag shouldn't have been kept because
> the patch needed reviewing again.
> 
> > By placing it above the Signed-off-by line, we at least clearly
> > indicate that it's Neil who put it there.
> 
> Who put it there does not matter, so it's not really a problem that
> needs solving.
> 
> However, there is a problem if b4 is preserving Reviewed-by tags for
> patches with material changes ... the review has to be redone and thus
> the tag should be lost.  You can only keep Reviewed-by tags for
> cosmetic changes (or obviously patches which don't change from version
> to version).

I am not disagreeing, but as far as b4 is concerned, there is no way to
recognize this reliably. A rebase to a newer tree may have resulted in the
patch-id changing, with the actual logic remaining exactly the same. It's the
responsibility of the person submitting the series to make sure that the
trailers are still relevant -- the best I can do is to clearly indicate who
was the guilty party behind the decision.

-K
