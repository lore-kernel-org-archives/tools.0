Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D6B70
	for <tools@linux.kernel.org>; Fri, 14 May 2021 22:50:34 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id n25so297408edr.5
        for <tools@linux.kernel.org>; Fri, 14 May 2021 15:50:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=Pj/Yu0WCJmio7EO1J9Jot7waw/EMsenPO4ZYsaBv/Gk=;
        b=uSVOF6vNOZRGp1S9jL09B4e4aKFhNdQXvS1ZznltXmWLXiWL7zD5wlYXnlHoYzwYkx
         x6Ql6HQpQ2I/asXQI2gehG3OJLwaRXfN7ENEiSpkACeFrkGwyD1rowZHo9VWQEh+GZ+G
         Tc5pef7IS2Mh4MbGkaUl7pB6MLql6nCisyNMnlQXnUQ3ngE/va8u+siOl6kNFOxo2XR7
         ggKqWkOHRw8FcAGWzSpcWR9+PZvXAjHdTr9YEGuWGInew+/nTftS6ZQ1ttFGgILNvOZ/
         YxP/kCt5slafkUsYtaW8z93H8NGGL1l4g+gdvyuazwV+/AS5LUe/tXD9YFOxE3Vu7CHn
         Vr2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Pj/Yu0WCJmio7EO1J9Jot7waw/EMsenPO4ZYsaBv/Gk=;
        b=PqvqV90cr3eVLLS2URa1b8RbpS4CvPxKTIp8J3pwk+Xe7mjp9qRyPZeYlx0Z2YQ6kz
         tvl/mNc43mqn+xzRaT2nAloiS8Jbu/P/EBe9RlGb2CZagvA3tjX5HvHGlV9O3V46Dq2/
         fadwKsz4gvx6z//DzerzASmRvaMKUZwNGPSnZE3XYRX4H2pIB3wfJKuGZhqz2QqobtzN
         hkusFiut4rezpY4U4oEaoL7YHeSMKE+im+POBQ9bceicbHd6gaudzmLdmBhqRHQx8xJD
         c4rPD0zjnO4QY5TlthBr9Zo1MeDHNu1dVzdVbge/qiMNhYSbFHp/endm0d9bFp4Z9LFd
         Yrog==
X-Gm-Message-State: AOAM5336Lgm/TPifoDf8wXtKYkGDg9S87JCotpcA+gLdF+CJcMYj7da1
	ULDCel6UxyoyAsjpBMaby3CD4G//rZ4Cs9n7kMPrLaRGXj3n4w==
X-Google-Smtp-Source: ABdhPJzsdZIbn5SXSEYshXExq2IHQtH+s1r9oAfTFpNyaUvsvBZrYe+9dx8KUdaam6fJNYNbjnbLq1W031z1ztycwQs=
X-Received: by 2002:a05:6402:128f:: with SMTP id w15mr12811714edv.354.1621032632539;
 Fri, 14 May 2021 15:50:32 -0700 (PDT)
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 14 May 2021 15:50:21 -0700
Message-ID: <CAPcyv4ggbuHbqKV33_TpE7pqxvRag34baJrX3yQe-jXOikoATQ@mail.gmail.com>
Subject: b4 am support for partial series updates?
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

I recently had someone grumble at me about my requirement that they
repost a full series just so "b4 am" could autograb the full set even
though only a handful of patches changed.

As an experiment I tried replying to a patch to update and marked it
v5, but b4 am reports:

# b4 am 162096970332.1865304.10280028741091576940.stgit@dwillia2-desk3.amr.corp.intel.com
...
Writing ./v5_20210514_dan_j_williams_cxl_acpi_introduce_acpi0017_driver_and_cxl_root.mbx
  ERROR: missing [1/8]!
  ERROR: missing [2/8]!
  ERROR: missing [3/8]!
  ERROR: missing [4/8]!
  [PATCH v5 5/8] cxl/acpi: Introduce ACPI0017 driver and cxl_root
  ERROR: missing [6/8]!
  ERROR: missing [7/8]!
  ERROR: missing [8/8]!

...which is helpful if v5 was partially sent, but not if all the other
patches don't require updates. This feels like a "WANTVER+" option
that means "grab latest, but fall back to vX" for missing patches. Has
this come up before?

What format would help b4 detect this situation? By default tooling
would make the prefix be [PATCH], I manually made that [PATCH v5 5/8]
and forced the in-reply-to message-id to the v4 version.

I'm nearing the point where handling this manually is more painful
than figuring out a b4 patch, but please consider this for the b4
feature backlog in the meantime.
