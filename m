Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 647947C
	for <tools@linux.kernel.org>; Thu, 22 Sep 2022 18:01:22 +0000 (UTC)
Received: by mail-qv1-f42.google.com with SMTP id m9so7379535qvv.7
        for <tools@linux.kernel.org>; Thu, 22 Sep 2022 11:01:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=4VxxcfxGz8ukOO/lKmlcCea5f/VTWvixXj8aWkGJYUE=;
        b=bVuylPgC6Wk3xGLsWFqbu4XGaCe3h3KEKNVKvjbokw7ORzmfz2fSo6U2WgWOzLuV0k
         H/p+fsm5239EHQeofDQufoN4FTvYdDeADwzfNP6Z8wQpmgWUuYTEp72fT6X82zi9heS3
         FWS1cCzg9MeFG4/PnAfca4mantHYssU21lbDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4VxxcfxGz8ukOO/lKmlcCea5f/VTWvixXj8aWkGJYUE=;
        b=gOjhJ40jV0sXeMs8MHxuEFO7of+PA7pg2/bBMIfdxIo+M2HG28OiFUPP7dhyIgn/nF
         5+LJvvO8JFSrL205EYfS1L4TYO5keoO4gKwPp+scAAXCRUje0TnFuX43NMjHyLqoCydD
         qEoWWjPgCScpnxScydfU6gd/D9Qyvgni0ayzt7v2Js5XmIFGwAULlFgstp3gn7jVthe6
         606v2SrjSRzpLbs6RC4rq9ga7hYvVrNbs8XgXBRMPvsZD3t3AEfSCzvSWwPzYXumw0Ro
         qH2lD3W4krJvw4+j6h8SVphxneiZy1DvI+GnYJbjhjfynaRSyNk7zojZQvOkfUBsPl6y
         Kaeg==
X-Gm-Message-State: ACrzQf2C9p0NKQf8vZTU+BHgJACb12u/HI5wirUdw+s3smcPxvmJ/HLW
	UnA0ONdkgaLfeZH5BpV+bsWJrw==
X-Google-Smtp-Source: AMsMyM7loEb7eDuhBWvQ6KpgcR7F5ropIEzUGhN2Ocg4jfUaFssMQ8pEgmrrAiYeBkTaDFP/wmO27w==
X-Received: by 2002:a05:6214:1ccf:b0:495:cf4a:4041 with SMTP id g15-20020a0562141ccf00b00495cf4a4041mr3719115qvd.38.1663869681253;
        Thu, 22 Sep 2022 11:01:21 -0700 (PDT)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id f4-20020ac80684000000b00339b8a5639csm3698061qth.95.2022.09.22.11.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 11:01:20 -0700 (PDT)
Date: Thu, 22 Sep 2022 14:01:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 cover-letter in single patch submission
Message-ID: <20220922180119.jnggtlpwu5yhxoc7@meerkat.local>
References: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3b1af982-83f1-d5ed-6df1-c654df481899@baylibre.com>

On Wed, Sep 21, 2022 at 02:23:18PM +0200, Amjad Ouled-Ameur wrote:
> Hi,
> 
> I would like to open a discussion regarding b4 tool. I read in the b4 doc
> that it will always include a cover-letter even when sending a single patch
> [0]. This is regarded as a proactive feature in case the submitter is later
> asked to split up the single the patch to many patches.
> 
> However, this can upset maintainers and reviewers when a single patch (that
> does not need to be split up) is sent with a cover letter that would
> probably contain the same title and text as the single patch.
> 
> My humble opinion is, adding a cover letter to a single patch should be an
> optional feature.
> 
> In this case, it might even be convenient to keep the change-id and
> changelog in the patch's comment section.

I agree, I never really liked forcing the cover letter on a single-patch
series. I've committed the initial implementation of mixing in the contents of
the cover letter into the patch basement itself. The implementation is not as
clean as I would have hoped it to be, but it seems to do the right thing in
most of my tests.

Please try it out and see if that's more like something you were thinking.

I'll backport it to 0.10.y as well.

-Konstantin
