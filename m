Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7129F7E08
	for <tools@linux.kernel.org>; Tue, 20 Sep 2022 18:59:41 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id ml1so2740768qvb.1
        for <tools@linux.kernel.org>; Tue, 20 Sep 2022 11:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=HBQHThos45NjE+e26vJ2kMU1zbXi311HfWBPCRHMyKY=;
        b=CAuUhaAI3mpXSkpXvflyEjxhE+H5n9EEFdyHTHHw5/NmaG5Bp/XmtArDj+qkAW7+n1
         CmWjy1v/LuiXUasLuS6/qB6gc+tsSgQ6/spa79yEshraLRZ+TkqYiHlc4FlQJPSmsSAd
         IncaF6ozIItVcI3psej2ket13cq72I5ryWrPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=HBQHThos45NjE+e26vJ2kMU1zbXi311HfWBPCRHMyKY=;
        b=jxDdwsfGXzClYtpkeKrVHVIl6cwnet0t0pOSN2hTNIJOeHNIo4HsFGPRFGth+NrQtx
         AfgfDxqHGrSZlrcSIR5avFYkG8DoguzrRic/1ekEKJt5sfsvTtjUiQ2MHrM+8dmpfsj7
         /eiQkUeJs2sWDnkXAq0xTl4EzPqn6x6WO6282725fi8mM6JXGlLzIravSyaKrZuqPFz1
         OqYvXxG5hHxLrhZ+k0sXSLV6JPT8vyFNUuvHVU4YqVatKuUss3PfaVhrkUe79l9aaAyM
         +0VILqXQNOnYsfiv6HhBbTVXEZzaQtUADHzdx5Dvh4mvNd740GJPtnFageFurMa02Sux
         NdQg==
X-Gm-Message-State: ACrzQf3dlN73ma7+H5g6kzlonxB4VtLsUs+KJD2fjVjmaI0D/hmiJGw8
	PeH0lvLqAsMMBxZoGxpB5VrA1A==
X-Google-Smtp-Source: AMsMyM585mK6aO9e5tuGn8fPK7O+MXKQu/LL7Z5ZPazVOaY3wsByKp8791coWfAlkHxiZnpCpksRkw==
X-Received: by 2002:a05:6214:20e2:b0:4ac:b9a6:17be with SMTP id 2-20020a05621420e200b004acb9a617bemr19754300qvk.104.1663700380336;
        Tue, 20 Sep 2022 11:59:40 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id u9-20020ac80509000000b0034454067d24sm221864qtg.64.2022.09.20.11.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 11:59:39 -0700 (PDT)
Date: Tue, 20 Sep 2022 14:59:38 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Leon Romanovsky <leon@kernel.org>
Cc: users@linux.kernel.org, tools@linux.kernel.org
Subject: Re: b4 v0.10.0 is available
Message-ID: <20220920185938.i5mq7m743wdcw5tr@meerkat.local>
References: <20220916181319.okfskienqh6kfeor@meerkat.local>
 <YymDlmJG8fNhvHSY@unreal>
 <20220920144855.bxe4qtmibbu472rh@meerkat.local>
 <Yynz6A51ULumuBVJ@unreal>
 <20220920181538.3pswzay3ewbpu6z5@meerkat.local>
 <YyoHdo7wjKzz6UXb@unreal>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YyoHdo7wjKzz6UXb@unreal>

On Tue, Sep 20, 2022 at 09:33:26PM +0300, Leon Romanovsky wrote:
> So only patchworks, that is not updated, left :)
> 
>    52 [b4]
>    53         pw-url = https://patchwork.kernel.org/
>    54         pw-project = linux-rdma
>    55         pw-key = my_secret_key

The docs were lying, you need three more entries. Here's how it should look
like:

    [b4]
      pw-url = https://patchwork.kernel.org/
      pw-project = linux-rdma
      pw-key = my_secret_key
      pw-review-state = under-review
      pw-accept-state = accepted
      pw-discard-state = deferred

The docs shouldn't lie any more with the latest commit.

-K
