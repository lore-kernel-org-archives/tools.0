Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FCC61
	for <tools@linux.kernel.org>; Mon,  8 Mar 2021 16:33:57 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id d20so9886746qkc.2
        for <tools@linux.kernel.org>; Mon, 08 Mar 2021 08:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=O+pVkG316wVWBUkYRAS7B3yYK4u4i1IbIh6zitD0mbs=;
        b=P1bUAm1NRGB/Xf5Mbd2JOiKIz3JZ/FIXdjiWriypO40IM1MCq7y2HK5lB+XkB8PL+O
         J9kZ9powkfQP/uEUgrhKaArein/+W02w3d+l0ZTp855M8kWYpynNhNLgkMI2lPf1Uw+t
         Jv3jXHteM95ao7e+Ui4a7J1QCFJALcIstQSvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=O+pVkG316wVWBUkYRAS7B3yYK4u4i1IbIh6zitD0mbs=;
        b=stWEkVMhZS7/AtWBkdwTzHFJ9tFAF4FgsCnMTqd/6hwtgl5SVeQYu2khKoImflNcYs
         NkhM8+8ZlxOQqY1SRzvFsqQD5jGVjpp6es8guACL2N7sPKUzrtz/JvpbfxvLbuQoBHv/
         EiNqIvc1CWbTWevPMTnKfvfd6gc+vEU0Jf1dZFjVJ+5HmyjlBLnSz29n7ZPyFZNp6G4H
         vt/LL+tbaoG5K3tjSA6BEVp6PzkNlv12jHaU/c6ZMJN07FYh+urnQypnV++Q/oCr4dRJ
         qGKVqZhkD80uoDBepExsUcSaeGTEI6w/vfPWB8c8FCw2jWDL6GEVsMaMhW/wPa0VWum9
         uOpA==
X-Gm-Message-State: AOAM532m6CZuy6Qcl4K2r7Dmha/9NrG3/2HHN5PduadkdUzXidvAaYkl
	N/yzKkorhXyB9QvcOK8v44Bj7xTDPylpdg==
X-Google-Smtp-Source: ABdhPJxv6dfMOhewpZvSagR6PcjwHKh1PM4iCniyzoT08Sym/1CRGbcG16ULwXU26M9apwRd033kZA==
X-Received: by 2002:a37:7c8:: with SMTP id 191mr21528039qkh.53.1615221236185;
        Mon, 08 Mar 2021 08:33:56 -0800 (PST)
Received: from chatter.i7.local (bras-base-mtrlpq5031w-grc-32-216-209-220-18.dsl.bell.ca. [216.209.220.18])
        by smtp.gmail.com with ESMTPSA id g11sm8126590qkk.5.2021.03.08.08.33.55
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Mar 2021 08:33:55 -0800 (PST)
Date: Mon, 8 Mar 2021 11:33:54 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: The tools list has been migrated
Message-ID: <20210308163354.2wt67naizztu6xkn@chatter.i7.local>
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <tools+subscribe@linux.kernel.org>
List-Unsubscribe: <tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="b25l2csep6tyhxqe"
Content-Disposition: inline


--b25l2csep6tyhxqe
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi, all:

You may have received a subscription notification earlier today and wondered
what was going on. This list got moved from groups.io to our own mailing list
service in order to better integrate with public-inbox and less depend on
proprietary infra behind groups.io.

We now also finally have proper public-inbox archives for the list and I will
be adding them to lore.kernel.org in the near future.

If you have any questions or concerns, please let me know.

Best regards,
-K

--b25l2csep6tyhxqe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQR2vl2yUnHhSB5njDW2xBzjVmSZbAUCYEZR8gAKCRC2xBzjVmSZ
bFfjAQCP4c05g1NIDDV2CiCiChxeWUgJGFN8szv/qL//Z6ZykQEAwU5PTEVmvq0g
SVwMiR5EKOrSsVhjMkR5/bUwW18PdwE=
=Os4R
-----END PGP SIGNATURE-----

--b25l2csep6tyhxqe--
