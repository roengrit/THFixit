using System;

namespace THFixit.Models
{
    public class ErrorViewModel
    {
        public string RequestId { get; set; }

        public bool ShowRequestId => !string.IsNullOrEmpty(RequestId);

        public string ErrType { get; set; }

        public string ErrTitle { get; set; }

        public string ErrMessage { get; set; }
    }
}