Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8933FC5
	for <tools@linux.kernel.org>; Tue, 21 Sep 2021 21:04:47 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id mv7-20020a17090b198700b0019c843e7233so568963pjb.4
        for <tools@linux.kernel.org>; Tue, 21 Sep 2021 14:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=myOC2GX4MtG92jgVCHnzYHbgpnV+okq1l1XerzQLz/Y=;
        b=NdwopFEkYw4qfTXLdF8COyu1yqC+Np6biPUjkuHkuhLmspR9XOd/ZAgOGgIzQTXBPi
         /fAIUpo/VHHE9ViD5CHl/iJ25ufmGVNBT8uIUoEKNCuBfZrVm+kwHyVVbWSxSeUqiDlR
         8FZJk9CdQcoAQIp9NJHl8HOmKA60MWwC8YsueOJgiDIFSBQv/lbq+VgYHQT2pg2lWnh8
         eyo9nM3RKNlFtL8xxPwkBTar705MZn2zUEYb5WKnrBAlHX+owr/pe7t8NhGpqwzopFie
         BSv6dcQbOzLh0Rz4pmmTHKZEtWaCg6JGllGa0iBckPsNocqtGFTrum/7JpPDUUGZ3uNd
         wOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=myOC2GX4MtG92jgVCHnzYHbgpnV+okq1l1XerzQLz/Y=;
        b=crDpenMjI9lXiHfmHzk3RjwFIPvMbgwP5NFtYLe4V/TCSrEAqkNmm8B1v1uJxqnXrd
         G27BZ7OsfOr7KkplU95QZvdmiWd5xNNFoEBbxHe481XTULanNuzzn7CydcZN9WdkLcVd
         Yy2vxg05lVb1WT32IqjZdHEnGxW1hFMDA0C8K0mFOftkx/653XDiUw7V4wq898IniDRb
         a4RRMlFMNsvRBbf0hMM9WfzuUEER4VG633WfN4jRcT+vQGniGfGbG9bqKcj+E9/FY/l9
         Y04i7vLt7ngEaMFP0/n+ub2kkz5eXfuzvEZHz0qoc9zF3zV1dxJEbL20OKgf4aGJ3l5V
         dYxw==
X-Gm-Message-State: AOAM531EnL+aw9ITJf80Di2HYXO7ZFOYqBuRg0sx/cKWqm/3OfneSEOZ
	gsfEDYxUr+EUbX3rQaztiw7+fv8eKwz6X5sb9IftNUEG5ibvWQ==
X-Google-Smtp-Source: ABdhPJzpwrI5cezMRYWDFXk0zosTaVGjpm/OCR8JIdIGtuL7zAgdH6s6tJNPMMidQVvlm3p1RILGF0UqeZLMdI2lU70=
X-Received: by 2002:a17:90a:d686:: with SMTP id x6mr7553726pju.8.1632258286413;
 Tue, 21 Sep 2021 14:04:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 21 Sep 2021 14:04:35 -0700
Message-ID: <CAPcyv4gS6St_EuWWQwVAF-1XbMQmxLFHU8sVKPO3xiBiTS-GMQ@mail.gmail.com>
Subject: b4 am partial-re-roll vs reviewed-by
To: tools@linux.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I notice that:

b4 am 163225205828.3038145.6831131648369404859.stgit@dwillia2-desk3.amr.corp.intel.com

...warns about a case where I manually replied with a reviewed-by tag
of someone else which is a great feature.

The bit of magic I was also hoping for it to notice is that [PATCH v4
17/21] picked up a reviewed-by with a note that said effectively "if
you fix this, then apply my reviewed-by":

https://lore.kernel.org/r/20210910105313.00006408@Huawei.com

I then neglected to manually add that tag when sending v5:

https://lore.kernel.org/r/163164680798.2831381.838684634806668012.stgit@dwillia2-desk3.amr.corp.intel.com

It would increase b4's already high levels of usefulness if similar to
the -S warning there was a warning of "vX picked up a reviewed-by,
carry that forward by re-running with <option foo>". Sometimes it's an
oversight to miss a previous review tag, and sometimes it is
deliberate that the submitter believes that previous review is
invalidated by the new submission.

No worries if this does not cleanly fit into the b4 series assembly engine.
