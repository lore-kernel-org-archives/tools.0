Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A27270
	for <tools@linux.kernel.org>; Tue, 13 Apr 2021 20:49:35 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id d23so7263889qko.12
        for <tools@linux.kernel.org>; Tue, 13 Apr 2021 13:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition;
        bh=sVGI7Fm7X4UJh2c8JyJfl90S0Uz6FEt2enCdmhreqj0=;
        b=aYyrPePOkVX6R7ceRA1/uMpCxLSmEKeFa5XAVkryDEuFe7PajyHt3WPYgygrXl+tbC
         5syHSGjaoCw6YFZMMGZi6Ojggk+8O6AZ7hsixnA41fyzxTJ9wOZgfbEqfVk44cRdPIEJ
         KW+KzzITf98EFYlt/YD3wjuxf4FH/TRlNcBOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition;
        bh=sVGI7Fm7X4UJh2c8JyJfl90S0Uz6FEt2enCdmhreqj0=;
        b=S/zIAwoiajSibtlJDST7z6UL3eT0Z/PzzBe/25vzlBfPT6r0Gmu14lSsrlpbbIyjXR
         zSWOFYG3jL3XdnEguCevu+B2kvlhwpnd1cR8i+m7fLY4+Xvbep+/a2ZpSipawI9+HdS8
         cJ5vtJLj7lMVfmx4Q/v5YFc0EayPchGsbDAclBIyPvEWVX28M1o0DDxGd7UP3fOUvPDn
         rlXxsKtmNIDbw3uSvb6GES1GhVsD5S8zKJrafjHmZJGIqcFZM6QM6u1t4QgxJ6FApv9F
         MaQPvL2Q8SfTlaDXiJDDi+on6ku/rsLo+thAxop/OTnALW2HCXTwpeb48jZ9dlFNjfTW
         aaqg==
X-Gm-Message-State: AOAM5311j8Lbh79pASHgMebwA05fd5u+C0pFhrnMHBu77moEIcltoJYR
	+9Pxq9cfF1NZAb7hnr+JiCsGhf99Xq8s/g==
X-Google-Smtp-Source: ABdhPJyoea4x+RXRVxNY69VqyRosVYMxKZkHn/ZfdIeKjfBr70r3gMuNv2uu+oonVb+WIHdDMpv01w==
X-Received: by 2002:a37:65d4:: with SMTP id z203mr32888540qkb.254.1618346974434;
        Tue, 13 Apr 2021 13:49:34 -0700 (PDT)
Received: from nitro.local ([89.36.78.230])
        by smtp.gmail.com with ESMTPSA id d62sm254119qkg.55.2021.04.13.13.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 13:49:34 -0700 (PDT)
Date: Tue, 13 Apr 2021 16:49:32 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: users@linux.kernel.org
Cc: tools@linux.kernel.org
Subject: RFC: Superseded-by: follow-up trailer
Message-ID: <20210413204932.yovoa7njwc56jo5v@nitro.local>
Mail-Followup-To: users@linux.kernel.org, tools@linux.kernel.org
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

B4 (and git-patchwork-bot) try to deal with series revisions, but the process
is not infallible due to needing to guess whether one series obsoletes another
via weak string matches (subject + author). If v2 arrives with a modified
subject than in v1 (even if it's a typo fix), or from a different email
address, then auto-matching will fail.

I would like to propose a "Superseded-by" follow-up trailer to help strengthen
the link between series revisions. The trailer needs to be sent as a follow-up
to the cover letter or first patch of the previous series.

    Superseded-by: [url-ending-with/message-id-of-next-version]

Example:

After submitting a new series revision, a contributor sends a follow-up email
to the previous series submission, adding a single follow-up trailer, e.g.:


    Subject: Re: [PATCH v2 0/2] frobdrv: reduce frob latency

    [...]
    > Please submit a new revision that fixes this problem.
    >
    > Nacked-by: Maine Tainer <mtainer@example.com>

    Hi,

    I just submitted a v3 with these fixes.
    
    Superseded-by: https://lore.kernel.org/r/foo-bar-3333-1-git@example.net

Of course, I don't expect a lot of folks to remember to do this, but I hope to
incorporate this into the upcoming "auto-pr-exploder" tool that helps folks
turn pull requests into well-formed patch series. In the same vein, when
git-patchwork-bot recognizes that a series is superseded by a newer version,
it can send an automated follow-up to the list to help indicate to the
maintainer that a newer version of the patch/series is available. 

When b4 encounters this trailer, it can issue a warning to the maintainer that
they aren't retrieving the latest series revision (and can automatically grab
the new one if instructed to do so).

Please let me know if this sounds reasonable.

-K
