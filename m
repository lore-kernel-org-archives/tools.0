Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web12.22380.1600619482023518855
 for <tools@linux.kernel.org>;
 Sun, 20 Sep 2020 09:31:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: k.kozlowski.k@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id j2so10538653eds.9
        for <tools@linux.kernel.org>; Sun, 20 Sep 2020 09:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=dLzvav/PkQBFPDVbvcG3buMTK1lURYqeMR3pQ7H0lDg=;
        b=ajIjTFuLEizqrbYOFFTu6+hXix4+hdEx1VLZcOn5aAHWXRl0VqbIZENbT2bC6nXYNq
         O1N4zZhCVuYL3J5A1Sj6AmVMKJHAxlczRw4OfdGF4/rNd69q7e2TttENzNP/76fgSCPO
         AuPv6PmmAgg4xim5OLzH0YbBDXIjNsbAqiBRMNcdDlJqQNs5FUFy2zKzEoVwuabUvQVb
         ENOOJ0xNttLSdobX4banXB29DlfBak3pyAK16aMuReOAMNqw5A4+fjmr+sn6RvUn1c+T
         TabmdN8Iu6nlZKGGnXSgglSoYr38cDxFjtQfL6vbpXdpciMnm2wb4EVWi0vvwTccdcdo
         nu+g==
X-Gm-Message-State: AOAM532IsDaNTxqk6rCIHUrh95TDQDyR9iG6SkFTt34G8YDD4Dft91Lb
	pfZUa/P0tR+F5gD8Dhypl2+KnHzpbF4=
X-Google-Smtp-Source: ABdhPJwCTKJSYmKt70PlCYJ0nnXE4lId2MyWRNwQIM4W7UB9GmxzBs8v/d6gi2Dhd7lQd3qdeCqZpg==
X-Received: by 2002:aa7:c504:: with SMTP id o4mr49773526edq.82.1600619479626;
        Sun, 20 Sep 2020 09:31:19 -0700 (PDT)
Return-Path: <k.kozlowski.k@gmail.com>
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id cf7sm6792587edb.78.2020.09.20.09.31.18
        for <tools@linux.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 09:31:18 -0700 (PDT)
Date: Sun, 20 Sep 2020 18:31:17 +0200
From: "Krzysztof Kozlowski" <krzk@kernel.org>
To: tools@linux.kernel.org
Subject: b4 diff -m: max() arg is an empty sequence
Message-ID: <20200920163117.GA15084@kozik-lap>
MIME-Version: 1.0
User-Agent: Mutt/1.9.4 (2018-02-28)
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi,

$ b4 mbox '1600234622-8815-2-git-send-email-yilun.xu@intel.com'
$ b4 mbox '1599553645-26928-1-git-send-email-yilun.xu@intel.com'

(the second mbox is actually a cover letter as b4 could not download the
actual patch directly via its Message-Id)

$ b4 diff -m 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx 1600234622-8815-2-git-send-email-yilun.xu@intel.com.mbx

Loading 8 messages from 1599553645-26928-1-git-send-email-yilun.xu@intel.com.mbx
Traceback (most recent call last):
  File "/home/kozik/.local/bin/b4", line 11, in <module>
    sys.exit(cmd())
  File "/home/kozik/.local/lib/python3.6/site-packages/b4/command.py", line 222, in cmd
    cmdargs.func(cmdargs)
  File "/home/kozik/.local/lib/python3.6/site-packages/b4/command.py", line 65, in cmd_diff
    b4.diff.main(cmdargs)
  File "/home/kozik/.local/lib/python3.6/site-packages/b4/diff.py", line 115, in main
    lser, user = diff_mboxes(cmdargs)
  File "/home/kozik/.local/lib/python3.6/site-packages/b4/diff.py", line 108, in diff_mboxes
    chunks.append(lmbx.series[max(lmbx.series.keys())])
ValueError: max() arg is an empty sequence


Ubuntu 18.04.5
Python 3.6.9
b4 0.5.2

Best regards,
Krzysztof

