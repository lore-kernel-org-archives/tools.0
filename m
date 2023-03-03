Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B048F42
	for <tools@linux.kernel.org>; Fri,  3 Mar 2023 20:28:30 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id cf14so4230162qtb.10
        for <tools@linux.kernel.org>; Fri, 03 Mar 2023 12:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1677875309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=//OuZS0okhi58phb1e1bVJDMoH+7+lPYCcr89jmlJ4E=;
        b=gv6ph8RO9jpgO6a0LNT1oQPpPApHf8vlUTMcx4E/oCXEtchbOnfNk3sfB1+KhHhcav
         TLJLOkRO0mZytZKDYyP+Nkz1LshDGbeLj2PuGUvo5ZzBPFLFk+DLTRcH5CdKFU6ry90u
         WsVOXhBj9Ses0kjbFdMqyVprLUz9p9cDIMW3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677875309;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=//OuZS0okhi58phb1e1bVJDMoH+7+lPYCcr89jmlJ4E=;
        b=7tTiCGEXDcGGhZM/D4GVakTswC7i3Jy06YxygRcW58SRwKYwWuiAb8UEXb3+6fuN35
         Xt3vtcUlEpEna1MLzUKmCpuGcVMS2V7ypbObfFaOieQOGNkQza/99VaaEjf6t2Nh3WEC
         7MdhiR8oM4GrzyBvqB+ZNKzhFLEhdqUroaZhr+J/W8voEQWAiqzCI1/qpKk/c5s1/x8v
         l2ONHrYH/m5oTV+QFzSsBL51PL7eY9jBu47F0g+YAJgLGK3IlStIvRW+t2UGJtwEQAHD
         suNugXUFbxF8rTN34yG3xuKxrXeOdNjb9l7ubBWVFKejC4kBw28vMHhsws+9ZTfV9iXv
         vdmA==
X-Gm-Message-State: AO0yUKV+vMANx7U3ayzNJVHvArSoajhxo5tXZGoZY2P6U6zW42F2EJXp
	Lw+7tLKkBZl6pEXWNNCQTzRjoaUev7UAVFD3
X-Google-Smtp-Source: AK7set9kcVIOY5Ku/uSSxE2Hw2wFLFKh5tivhpyXQOUF/vgicPPQQXPuxpPpD1TaBhb56hWCiz3Ttw==
X-Received: by 2002:a05:622a:182a:b0:3bf:cd42:7724 with SMTP id t42-20020a05622a182a00b003bfcd427724mr5949100qtc.11.1677875309148;
        Fri, 03 Mar 2023 12:28:29 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id do53-20020a05620a2b3500b00741b312c899sm2401474qkb.6.2023.03.03.12.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 12:28:28 -0800 (PST)
Date: Fri, 3 Mar 2023 15:28:26 -0500
From: "konstantin@linuxfoundation.org" <konstantin@linuxfoundation.org>
To: =?utf-8?B?SMOpY3RvciBPcsOzbiBNYXJ0w61uZXo=?= <hector.oron@gmail.com>
Cc: tools@linux.kernel.org
Subject: Re: b4: allow test run when source is not in git
Message-ID: <20230303202826.oosmitsekewoubeo@meerkat.local>
References: <CAODfWeFXwz4Ci5A=VaUvmyZL2daYe48+OOrjvq6wC-KTJS4hRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAODfWeFXwz4Ci5A=VaUvmyZL2daYe48+OOrjvq6wC-KTJS4hRA@mail.gmail.com>

On Sun, Feb 12, 2023 at 01:41:40PM +0100, Héctor Orón Martínez wrote:
> Hello Konstantin,
> 
>   I am maintaining the b4 Debian package and we got a build failure
> when running the tests due to the use of git rev-parse.
>   https://bugs.debian.org/1031130
> 
>   I have included the following local patch to remediate the immediate
> issue, which I would like you to consider adding to the b4 source
> tree.

Thank you. I didn't take the patch, as it wasn't quite what was needed, but
there is a fix in place now that should allow running tests from tarball
sources.

I will backport it to 0.12-stable.

Thanks,
-K
