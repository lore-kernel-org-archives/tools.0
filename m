Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2983185D
	for <tools@linux.kernel.org>; Fri, 27 May 2022 14:09:52 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id y15so5436287qtx.4
        for <tools@linux.kernel.org>; Fri, 27 May 2022 07:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=efO7PZqpHxSTndLxP1vgEGyDPaOf9jIGt9E0/vDw0Lw=;
        b=lBQ1/Ri3rw+ooY2T8iAX9t+HuunVuRCxo0HExORIReiOQZBCryu28VEGP4h28YtYJk
         nkI5vd+QJTHGArF4SQgK5//VY/7EUroiaUMdk0/VIZYZy0bvaZ2qhTYftisD/g+E0K1A
         E5iAbvuPe4sqiSSo1QhvqPDvfUXYurOJwHjOYO+qft1I9DKEkmOH7qTicFTPT9iq3Dnb
         MP7F8OaP1fmM2u5eb1T+XeH17yp1l32XRTal2Duz2tczxYNhM0Y+jmnTorttyk/JKSQr
         vN33nZHD9ZaKTY2kQ05aiPBpCVALuN2bYKo2ELsfgvgqP0QZaV8tmDt8rrvTNLWJyvKy
         4GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=efO7PZqpHxSTndLxP1vgEGyDPaOf9jIGt9E0/vDw0Lw=;
        b=YqzEVgS34tw+m5MNUYNZ+M8fEnIS54KhlkvLVEwYSwlkfFdHkJFz9h/4YHbVDPiw+s
         0KL/pttf+gtIs7M521H52Pb77ktARklwYE0+DpZxj7X9IpD2MetMtaqOnzjVaNkSKL3o
         B2ZTcN6UGJqrqwLo+azV6Ns+05XCUlHGcvMtio8ylZ55dkXVJJDgaEpfNjd+cgokiDfl
         T3I6kxkQiXFnFd4T2NhqDFMwkusMz+x3zINDvpdlgfat0hyPy+nxogicgdAyNQ2eDZ6b
         P9gFJ6SK4fpq9KXLlEaMm7pbgz0akQMKjw1+pbioa1/SC/gASQR4pdeFL1bCZLj+ThNH
         Wa6g==
X-Gm-Message-State: AOAM530kOza2I4P+TV3OmCfrRmyJ2iEv1p8yjtHV0NfzrmJSou1NkPzJ
	JTpZTSyWcIG9NMYkBi0C1YP9u04HkPj36Q==
X-Google-Smtp-Source: ABdhPJyN1FpISZeg7OoSi+meYiNSxBPJIIQd+x0J/rMsRcTJnw1p1fVcKSj9vEKaz6WkPXuZ2lpECA==
X-Received: by 2002:a05:622a:1793:b0:2f9:1765:7064 with SMTP id s19-20020a05622a179300b002f917657064mr29561869qtk.266.1653660591413;
        Fri, 27 May 2022 07:09:51 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id l125-20020a37bb83000000b006a35380f61dsm2945336qkf.10.2022.05.27.07.09.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 May 2022 07:09:50 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
	(envelope-from <jgg@ziepe.ca>)
	id 1nuaf0-00DXio-3o; Fri, 27 May 2022 11:09:50 -0300
Date: Fri, 27 May 2022 11:09:50 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@linux.kernel.org
Subject: b4 and lore are mangling from lines in patches
Message-ID: <20220527140950.GE2960187@ziepe.ca>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Konstantin,

I noticed this:

$ b4.sh am https://lore.kernel.org/linux-iommu/20220527070307.2359150-1-liuke94@huawei.com
$ grep ^From 20220527_iommu_drivers_iommu_directly_use_ida_alloc_free.mbx
From git@z Thu Jan  1 00:00:00 1970
From: keliu via iommu <iommu@lists.linux-foundation.org>
           ^^^^^^^^^^^^

And when this is git AM'd the from line is mangled.

I see this is leaking into the main repo now:

commit 9ed1d7f510336e283c0bb2d20fd771e9d8fa085b
Author: Vasant Hegde via iommu <iommu@lists.linux-foundation.org>
Date:   Mon Mar 14 12:32:26 2022 +0530

    iommu/amd: Remove redundant check
    
    smatch static checker warning:
      drivers/iommu/amd/init.c:1989 amd_iommu_init_pci()
      warn: duplicate check 'ret' (previous on line 1978)

Can something be done?

Thanks,
Jason
