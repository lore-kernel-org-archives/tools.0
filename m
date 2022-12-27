Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E7429A2
	for <tools@linux.kernel.org>; Tue, 27 Dec 2022 15:15:27 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id bp44so7978480qtb.0
        for <tools@linux.kernel.org>; Tue, 27 Dec 2022 07:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LBCbGIBwZNomWw5BmV7H2ZVRszhp0cGaZspB9beSfQo=;
        b=VPvlWPG02aqlptFOSTwN1zHTkab2RpYMB962jWDRciwJxDHRTz369gPYicMqaAQiEW
         d/cuMBz8KvDdPiiAbq6+EKVND789Kzv4T5IANBqZLs9kHJKTxvonGmn9yQ0zRlX25nE2
         8d+y+4d+/AGPMlRTy9l+IG78S2OYtWng/v8/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LBCbGIBwZNomWw5BmV7H2ZVRszhp0cGaZspB9beSfQo=;
        b=ZHNoufCE5w7JMZBzh9JJT8vm1swXQhQxPXAbtvOM3chiPa3R8NzaGrxOXtaz+XVvVs
         mJD7tIou9lDN4WI+LVMnd8VmOz399z5Dbm37OZh15TOdorYAAjFdU+kuRyAG6d3zkzSH
         TsUicPaDB8DInRbTE5HJJkFOd5RAT8S2pU+5OpGbItXxAAzL2DqYmctmzCX4PPw3/td6
         SEvxf/Lc7OWevhZIH96S0M6p3oI/H5yB1uZcAcSPjqt6nXyb6wrvB2ZTmP6AIb6fF6/v
         OSP2RQgXVCTd2A1chn0si8A2QBQ8sUe+nxdaOQghLIF0hZhT3FRY6GGsmlKdHBhzA7Et
         Ta6g==
X-Gm-Message-State: AFqh2krLoXdDlc1FjSGLceMgonMrIEiXS9CB8AX3Bbz5A81tkAsRoOGW
	rMwJTNedSq9KYg9F47HA03pZg+CAmLbZV3iC
X-Google-Smtp-Source: AMrXdXuQWyITosPo4O/lrYL9xGQmYUOQWevHu1+CXNIBacLern3ZL2t3EcLFZZV37b7ykI6DBUvd4g==
X-Received: by 2002:ac8:6685:0:b0:3a8:123a:b549 with SMTP id d5-20020ac86685000000b003a8123ab549mr31527124qtp.46.1672154126858;
        Tue, 27 Dec 2022 07:15:26 -0800 (PST)
Received: from nitro.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id h20-20020ac85694000000b003a7e9db074asm8377550qta.67.2022.12.27.07.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 07:15:26 -0800 (PST)
Date: Tue, 27 Dec 2022 10:15:25 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Bill Pemberton <wfp5p@worldbroken.com>
Cc: tools@linux.kernel.org
Subject: Re: b4 and abbrevCommit
Message-ID: <20221227151525.3zq5zpx5x7ko7tww@nitro.local>
References: <01304af2-3412-8385-3336-4dda9104336e@worldbroken.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <01304af2-3412-8385-3336-4dda9104336e@worldbroken.com>

On Fri, Dec 23, 2022 at 05:22:27PM -0500, Bill Pemberton wrote:
> I've discovered that b4 will not work correctly if you have abbrevCommit set
> in your .gitconfig file.  For example, a simple 'b4 prep --edit-cover' will
> result in the cover letter not actually changing. You'll get the edit
> process and such, but after the fact the commit with the cover letter will
> still be the default one that b4 creates.
> 
> I assume all calls to git log and git show need the --no-abbrev-commit
> option.  Or at least this gotcha should be documented.

Thank you for the report, I will make sure we cover this case when invoking
git behind the scenes.

-K
